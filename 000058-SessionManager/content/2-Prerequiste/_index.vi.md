---
title : "Sơ đồ kĩ thuật"
date : "2024-01-01" 
weight : 2 
chapter : false
pre : " <b> 2. </b> "
---

{{% notice info %}}
Dưới đây là sơ đồ mô tả kiến trúc của dự án.
{{% /notice %}}

![Serverless AI Architecture](/Work-Shop/images/WS/Archtect.png)

**Người dùng:** Mở trình duyệt và truy cập vào giao diện web của chatbot được host trên Amazon S3.

**Frontend (S3):** Người dùng nhập câu hỏi và nhấn gửi. Mã JavaScript trên trình duyệt tạo một yêu cầu HTTPS POST chứa nội dung câu hỏi đến endpoint của API Gateway.

**API Gateway:** Tiếp nhận yêu cầu, xác thực và chuyển tiếp đến hàm AWS Lambda.

**AWS Lambda:** Hàm Lambda được kích hoạt. Mã Python bên trong hàm thực hiện:
a.  Đảm nhận (assume) một vai trò IAM được định cấu hình sẵn để có quyền gọi Bedrock.
b.  Xây dựng một "prompt" hoàn chỉnh từ câu hỏi của người dùng.
c.  Gọi API của Amazon Bedrock, truyền vào prompt và tên model.

**Amazon Bedrock:** Xử lý prompt, tạo ra câu trả lời và gửi lại cho Lambda.

**Response:** Lambda nhận phản hồi từ Bedrock, định dạng lại nếu cần và trả về cho API Gateway. API Gateway sau đó chuyển tiếp câu trả lời này về cho trình duyệt của người dùng.

**Hiển thị:** JavaScript trên frontend nhận được phản hồi và hiển thị câu trả lời của AI lên giao diện.


  


