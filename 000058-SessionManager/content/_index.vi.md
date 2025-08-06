---
title : "Serverless AI Chatbot with Amazon Bedrock "
date : "2024-01-01" 
weight : 1 
chapter : false
---
#### DƯỚI ĐÂY LÀ SẢN PHẨM CHATBOX AI.
{{< rawhtml >}}
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>AI Chatbot using Amazon Bedrock</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      color: #333;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
      color: white;
    }

    .header h1 {
      font-size: 2.5rem;
      font-weight: 600;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    .header p {
      font-size: 1.1rem;
      opacity: 0.9;
      font-weight: 400;
    }

    .chat-container {
      background: white;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
      overflow: hidden;
      flex: 1;
      display: flex;
      flex-direction: column;
      max-height: 600px;
    }

    .chat-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 20px;
      text-align: center;
      font-weight: 600;
      font-size: 1.2rem;
    }

    .chat-messages {
      flex: 1;
      padding: 20px;
      overflow-y: auto;
      background: #f8f9fa;
    }

    .message {
      margin-bottom: 20px;
      display: flex;
      align-items: flex-end;
      gap: 12px;
    }

    .message.user {
      flex-direction: row-reverse;
    }

    .avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      font-weight: 600;
      flex-shrink: 0;
    }

    .avatar.user {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
    }

    .avatar.bot {
      background: #e9ecef;
      color: #495057;
    }

    .message-content {
      max-width: 70%;
      padding: 15px 20px;
      border-radius: 18px;
      font-size: 0.95rem;
      line-height: 1.5;
      word-wrap: break-word;
    }

    .message.user .message-content {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-bottom-right-radius: 6px;
    }

    .message.bot .message-content {
      background: white;
      color: #333;
      border: 1px solid #e9ecef;
      border-bottom-left-radius: 6px;
    }

    .chat-input {
      padding: 20px;
      background: white;
      border-top: 1px solid #e9ecef;
    }

    .input-group {
      display: flex;
      gap: 12px;
      align-items: center;
    }

    .input-field {
      flex: 1;
      padding: 15px 20px;
      border: 2px solid #e9ecef;
      border-radius: 25px;
      font-size: 1rem;
      outline: none;
      transition: all 0.3s ease;
      font-family: inherit;
    }

    .input-field:focus {
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    .send-btn {
      padding: 15px 25px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 25px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      font-family: inherit;
    }

    .send-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
    }

    .send-btn:active {
      transform: translateY(0);
    }

    .welcome-message {
      text-align: center;
      color: #6c757d;
      font-style: italic;
      margin: 20px 0;
    }

    @media (max-width: 768px) {
      .container {
        padding: 10px;
      }
      
      .header h1 {
        font-size: 2rem;
      }
      
      .message-content {
        max-width: 85%;
      }
      
      .chat-container {
        max-height: 500px;
      }
    }

    /* Custom scrollbar */
    .chat-messages::-webkit-scrollbar {
      width: 6px;
    }

    .chat-messages::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 3px;
    }

    .chat-messages::-webkit-scrollbar-thumb {
      background: #c1c1c1;
      border-radius: 3px;
    }

    .chat-messages::-webkit-scrollbar-thumb:hover {
      background: #a8a8a8;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>🤖 AI Chatbot</h1>
      <p>Powered by Amazon Bedrock</p>
    </div>
    
    <div class="chat-container">
      <div class="chat-header">
        💬 Chat với AI Assistant
      </div>
      
      <div class="chat-messages" id="chatMessages">
        <div class="welcome-message">
          👋 Xin chào! Tôi có thể giúp gì cho bạn?
        </div>
      </div>
      
      <div class="chat-input">
        <form class="input-group" onsubmit="event.preventDefault(); sendMessage();">
          <input 
            type="text" 
            id="userInput" 
            class="input-field" 
            placeholder="Nhập tin nhắn của bạn..." 
            autocomplete="off"
          />
          <button type="submit" class="send-btn">
            Gửi
          </button>
        </form>
      </div>
    </div>
  </div>

  <script>
    let history = [];
    
    async function sendMessage() {
      const userInput = document.getElementById('userInput');
      const message = userInput.value.trim();
      
      if (!message) return;
      
      // Add user message
      addMessage(message, 'user');
      
      // Clear input
      userInput.value = '';
      
      try {
        // Show typing indicator
        addTypingIndicator();
        
        // Call API
        const response = await fetch('https://lvusy8c5xb.execute-api.us-east-1.amazonaws.com/dev/chat-box', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ message, history })
        });
        
        const data = await response.json();
        const botReply = data.response;
        
        // Remove typing indicator and add bot message
        removeTypingIndicator();
        addMessage(botReply, 'bot');
        
        // Update history
        history.push({ user: message, assistant: botReply });
        
      } catch (error) {
        removeTypingIndicator();
        addMessage('Xin lỗi, có lỗi xảy ra. Vui lòng thử lại.', 'bot');
        console.error('Error:', error);
      }
      
      // Focus back to input
      userInput.focus();
    }
    
    function addMessage(text, sender) {
      const chatMessages = document.getElementById('chatMessages');
      const messageDiv = document.createElement('div');
      messageDiv.className = `message ${sender}`;
      
      const avatar = document.createElement('div');
      avatar.className = `avatar ${sender}`;
      avatar.textContent = sender === 'user' ? '👤' : '🤖';
      
      const content = document.createElement('div');
      content.className = 'message-content';
      content.textContent = text;
      
      messageDiv.appendChild(avatar);
      messageDiv.appendChild(content);
      chatMessages.appendChild(messageDiv);
      
      // Scroll to bottom
      chatMessages.scrollTop = chatMessages.scrollHeight;
    }
    
    function addTypingIndicator() {
      const chatMessages = document.getElementById('chatMessages');
      const typingDiv = document.createElement('div');
      typingDiv.className = 'message bot typing-indicator';
      typingDiv.id = 'typingIndicator';
      
      const avatar = document.createElement('div');
      avatar.className = 'avatar bot';
      avatar.textContent = '🤖';
      
      const content = document.createElement('div');
      content.className = 'message-content';
      content.textContent = 'Đang nhập...';
      
      typingDiv.appendChild(avatar);
      typingDiv.appendChild(content);
      chatMessages.appendChild(typingDiv);
      
      chatMessages.scrollTop = chatMessages.scrollHeight;
    }
    
    function removeTypingIndicator() {
      const typingIndicator = document.getElementById('typingIndicator');
      if (typingIndicator) {
        typingIndicator.remove();
      }
    }
    
    // Enter to send
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


