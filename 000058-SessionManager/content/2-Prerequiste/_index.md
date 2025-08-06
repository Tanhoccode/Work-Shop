---
title : "Technical Architecture"
date : "2024-01-01" 
weight : 2 
chapter : false
pre : " <b> 2. </b> "
---

{{% notice info %}}
Below is the diagram describing the project architecture.
{{% /notice %}}

![Serverless AI Architecture](/Work-Shop/images/WS/Archtect.png)

**User:** Opens a browser and accesses the chatbot web interface hosted on Amazon S3.

**Frontend (S3):** The user enters a question and clicks send. JavaScript code in the browser creates an HTTPS POST request containing the question content to the API Gateway endpoint.

**API Gateway:** Receives the request, authenticates, and forwards it to the AWS Lambda function.

**AWS Lambda:** The Lambda function is triggered. Python code inside the function performs:
a. Assumes a pre-configured IAM role with permissions to call Bedrock.
b. Builds a complete "prompt" from the user's question.
c. Calls the Amazon Bedrock API, passing the prompt and model name.

**Amazon Bedrock:** Processes the prompt, generates a response, and sends it back to Lambda.

**Response:** Lambda receives the response from Bedrock, formats it if necessary, and returns it to API Gateway. API Gateway then forwards this response to the user's browser.

**Display:** JavaScript on the frontend receives the response and displays the AI's answer on the interface.
