---
title: "AWS Services Examples"
date: "2024-01-01"
weight: 1
chapter: false
---

# AWS Services Examples

## 1. Tìm kiếm Amazon Bedrock

Để tìm dịch vụ Amazon Bedrock trong AWS Console:

1. Mở AWS Console
2. Trong thanh tìm kiếm, gõ "bedrock"
3. Chọn dịch vụ Amazon Bedrock từ kết quả

![AWS Bedrock Search](/images/aws-services/bedrock-search.png)

## 2. IAM Dashboard

Giao diện quản lý IAM (Identity and Access Management):

![IAM Dashboard](/images/aws-services/iam-dashboard.png)

## 3. EC2 Console

Giao diện quản lý EC2 instances:

![EC2 Console](/images/aws-services/ec2-console.png)

## 4. Serverless AI Architecture

Kiến trúc Serverless AI với Amazon Bedrock:

![Serverless AI Architecture](/images/WS/Archtect.png)

## Mô tả dịch vụ

### Amazon Bedrock
Amazon Bedrock là dịch vụ giúp xây dựng và mở rộng các ứng dụng AI tạo sinh với các mô hình nền tảng.

### IAM (Identity and Access Management)
Quản lý quyền truy cập và bảo mật cho các tài nguyên AWS.

### EC2 (Elastic Compute Cloud)
Dịch vụ máy chủ ảo có thể mở rộng trong cloud.

### Serverless AI Architecture
Kiến trúc serverless cho chatbot AI sử dụng Amazon Bedrock với các thành phần:
- **Frontend**: S3 Static Site hoặc Amplify Hosting
- **API Gateway**: Điểm truy cập API
- **Lambda Function**: Xử lý logic
- **Bedrock (Titan)**: Mô hình AI
- **IAM Role**: Quản lý quyền truy cập

## Sử dụng trong Session Manager

Khi làm việc với Session Manager, bạn có thể cần truy cập các dịch vụ AWS khác để quản lý tài nguyên.

{{% notice tip %}}
Đảm bảo EC2 instance có quyền truy cập vào các dịch vụ AWS cần thiết.
{{% /notice %}} 