---
title : "Set permission for Lambda"
date : "2024-01-01"
weight : 2 
chapter : false
pre : " <b> 4.2 </b> "
---

In this step, we will create 2 roles: **AmazonBedrockFullAccess** and **CloudWatchLogsFullAccess** for Lambda.

#### Create **Permission policies**

Go to the add permission interface.
  + In the search box, type **AmazonBedrockFullAccess**.
  ![IAM](/Work-Shop/images/WS/IAM/SelectRoleBedR.png)
  + In the search box, type **CloudWatchLogsFullAccess**.
  ![IAM](/Work-Shop/images/WS/IAM/SelectRoleCW.png)
Then, name this Role **ChatBoxLambdaRole**
  ![IAM](/Work-Shop/images/WS/IAM/NameRole.png)

After that, click **Create Role**.
