---
title: "AWS Services Examples"
date: "2024-01-01"
weight: 1
chapter: false
---

# AWS Services Examples

## 1. Search for Amazon Bedrock

To find the Amazon Bedrock service in AWS Console:

1. Open AWS Console
2. In the search bar, type "bedrock"
3. Select Amazon Bedrock service from the results

![AWS Bedrock Search](/Work-Shop/images/aws-services/bedrock-search.png)

## 2. IAM Dashboard

IAM (Identity and Access Management) management interface:

![IAM Dashboard](/Work-Shop/images/aws-services/iam-dashboard.png)

## 3. EC2 Console

EC2 instances management interface:

![EC2 Console](/Work-Shop/images/aws-services/ec2-console.png)

## 4. Serverless AI Architecture

Serverless AI architecture with Amazon Bedrock:

![Serverless AI Architecture](/Work-Shop/images/WS/Archtect.png)

## Service Description

### Amazon Bedrock
Amazon Bedrock is a service that helps build and scale generative AI applications with foundation models.

### IAM (Identity and Access Management)
Manage access permissions and security for AWS resources.

### EC2 (Elastic Compute Cloud)
Scalable virtual server service in the cloud.

### Serverless AI Architecture
Serverless architecture for AI chatbot using Amazon Bedrock with components:
- **Frontend**: S3 Static Site or Amplify Hosting
- **API Gateway**: API access point
- **Lambda Function**: Logic processing
- **Bedrock (Titan)**: AI model
- **IAM Role**: Access management

## Usage in Session Manager

When working with Session Manager, you may need to access other AWS services to manage resources.

{{% notice tip %}}
Ensure EC2 instance has access permissions to necessary AWS services.
{{% /notice %}} 