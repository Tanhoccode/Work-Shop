+++
title = "Deploy Frontend Chat UI to an S3 Static Website"
date = 2021
weight = 7
chapter = false
pre = "<b>7. </b>"
+++

Chúng ta sẽ tiến hành Deploy trang web này lên.

#### Viết code giao diện cho chatbox

1. Đầu tiên ta cần tạo 1 file index.html để ta có thể dễ dàng deploy S3
   + Vào IDE của mình và tạo file **Index.html**.
    - Sau đó tham khảo code dưới đây :

{{< rawhtml >}}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>AI Chatbot using Amazon Bedrock</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      font-family: 'Inter', 'Segoe UI', sans-serif;
      min-height: 100vh;
      background: linear-gradient(135deg, #e0e7ff 0%, #f5f8fa 100%);
      display: flex;
      flex-direction: column;
      height: 100vh;
    }
    header {
      background: #232f3e;
      color: white;
      padding: 1.5rem 1rem 1rem 1rem;
      text-align: center;
      font-size: 2rem;
      font-weight: 600;
      letter-spacing: 1px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.75rem;
      box-shadow: 0 2px 8px rgba(35,47,62,0.08);
    }
    header .icon {
      font-size: 2.2rem;
      margin-right: 0.5rem;
    }
    #chatContainer {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding: 2rem 0;
      background: none;
    }
    #chatBox {
      width: 100%;
      max-width: 480px;
      min-height: 480px;
      background: #fff;
      border-radius: 24px;
      box-shadow: 0 8px 32px rgba(35,47,62,0.10);
      padding: 2rem 1.5rem 1rem 1.5rem;
      display: flex;
      flex-direction: column;
      gap: 1.25rem;
      overflow-y: auto;
      transition: box-shadow 0.2s;
    }
    .message-row {
      display: flex;
      align-items: flex-end;
      gap: 0.75rem;
    }
    .message-row.user {
      flex-direction: row-reverse;
    }
    .avatar {
      width: 38px;
      height: 38px;
      border-radius: 50%;
      background: #e0e7ff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      font-weight: 600;
      box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      flex-shrink: 0;
    }
    .avatar.user {
      background: linear-gradient(135deg, #0073bb 60%, #00c6fb 100%);
      color: #fff;
    }
    .avatar.bot {
      background: #e1ecf4;
      color: #232f3e;
    }
    .message {
      max-width: 75%;
      padding: 0.9rem 1.2rem;
      border-radius: 18px;
      font-size: 1.05rem;
      line-height: 1.5;
      box-shadow: 0 2px 8px rgba(0,0,0,0.04);
      word-break: break-word;
      transition: background 0.2s;
    }
    .user .message {
      background: linear-gradient(135deg, #0073bb 60%, #00c6fb 100%);
      color: #fff;
      border-bottom-right-radius: 6px;
    }
    .bot .message {
      background: #f3f6fa;
      color: #232f3e;
      border-bottom-left-radius: 6px;
    }
    footer {
      width: 100%;
      display: flex;
      justify-content: center;
      background: none;
      padding: 1.5rem 0 2rem 0;
    }
    #inputContainer {
      width: 100%;
      max-width: 480px;
      display: flex;
      gap: 0.75rem;
      background: #fff;
      border-radius: 16px;
      box-shadow: 0 2px 8px rgba(35,47,62,0.08);
      padding: 0.5rem 0.75rem;
    }
    input[type="text"] {
      flex: 1;
      padding: 0.85rem 1rem;
      font-size: 1.08rem;
      border: none;
      border-radius: 10px;
      outline: none;
      background: #f5f8fa;
      color: #232f3e;
      font-family: inherit;
      transition: box-shadow 0.2s;
    }
    input[type="text"]:focus {
      box-shadow: 0 0 0 2px #0073bb33;
    }
    button {
      padding: 0.85rem 1.3rem;
      background: linear-gradient(135deg, #ff9900 60%, #ffb84d 100%);
      border: none;
      border-radius: 10px;
      color: white;
      font-weight: 600;
      font-size: 1.08rem;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(255,153,0,0.08);
      transition: background 0.2s, box-shadow 0.2s;
    }
    button:hover {
      background: linear-gradient(135deg, #e48c00 60%, #ffb84d 100%);
      box-shadow: 0 4px 16px rgba(255,153,0,0.12);
    }
    @media (max-width: 600px) {
      #chatBox, #inputContainer {
        max-width: 98vw;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
      }
      #chatBox {
        padding-top: 1rem;
        padding-bottom: 0.5rem;
      }
      footer {
        padding: 0.75rem 0 1rem 0;
      }
    }
  </style>
</head>
<body>
  <header><span class="icon">🤖</span>AI Chatbot — Powered by Amazon Bedrock</header>
  <div id="chatContainer">
    <div id="chatBox"></div>
  </div>
  <footer>
    <form id="inputContainer" onsubmit="event.preventDefault(); sendMessage();">
      <input type="text" id="userInput" placeholder="Type your message..." autocomplete="off" />
      <button type="submit">Send</button>
    </form>
  </footer>
  <script>
    let history = [];
    async function sendMessage() {
      const userInput = document.getElementById('userInput');
      const message = userInput.value.trim();
      if (!message) return;
      addMessage(message, 'user');
      const response = await fetch('https://lvusy8c5xb.execute-api.us-east-1.amazonaws.com/dev/chat-box', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message, history })
      });
      const data = await response.json();
      const botReply = data.response;
      addMessage(botReply, 'bot');
      history.push({ user: message, assistant: botReply });
      userInput.value = '';
      userInput.focus();
    }
    function addMessage(text, sender) {
      const chatBox = document.getElementById('chatBox');
      const row = document.createElement('div');
      row.classList.add('message-row', sender);
      // Avatar
      const avatar = document.createElement('div');
      avatar.classList.add('avatar', sender);
      avatar.textContent = sender === 'user' ? '🧑' : '🤖';
      // Message
      const msg = document.createElement('div');
      msg.classList.add('message');
      msg.textContent = text;
      row.appendChild(avatar);
      row.appendChild(msg);
      chatBox.appendChild(row);
      row.scrollIntoView({ behavior: 'smooth' });
    }
    // Optional: Enter to send
    document.getElementById('userInput').addEventListener('keydown', function(e) {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        sendMessage();
      }
    });
  </script>
</body>
</html>
{{< /rawhtml >}}
