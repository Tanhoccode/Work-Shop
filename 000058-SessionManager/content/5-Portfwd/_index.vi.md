---
title : " Lambda Function"
date : "2024-01-01"
weight : 5 
chapter : false
pre : " <b> 5. </b> "
---

Trong bước này chúng ta sẽ tạo **Lamda Function**, có chức năng xử lý các logic nghiệp vụ là cầu nối giữa FE với BE.

  Vai trò của Lamda Function: 
- Nhận request từ API Gateway.
- Xử lý và format dữ liệu.
- Gọi Bedrock API.
- Xử lý response từ AI model.
- Trả về kết quả cho API Gateway.
  ![Lamda](/images/WS/Lamda/LamdaF.png)
{{% notice info %}}
  Ưu điểm : Serverless, tự động scale, chỉ trả tiền khi sử dụng
{{% /notice %}}



