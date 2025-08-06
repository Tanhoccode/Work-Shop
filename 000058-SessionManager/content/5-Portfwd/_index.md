---
title : " Lambda Function"
date : "2024-01-01"
weight : 5 
chapter : false
pre : " <b> 5. </b> "
url : "/5-portfwd/"
---

In this step, we will create a **Lambda Function** that handles business logic and serves as a bridge between Frontend and Backend.

The role of Lambda Function:
- Receive requests from API Gateway.
- Process and format data.
- Call Bedrock API.
- Process response from AI model.
- Return results to API Gateway.

![Lambda](/Work-Shop/images/WS/Lamda/LamdaF.png)

{{% notice info %}}
Advantages: Serverless, auto-scaling, pay only when used
{{% /notice %}}
