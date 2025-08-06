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
    https://github.com/Tanhoccode/UI/blob/master/index.html

2. Sau đó, ta vào S3 tạo Bucket
     ![S3](/Work-Shop/images/WS/S3/Bucket.png)

3. Create Bucket
     ![S3](/Work-Shop/images/WS/S3/BucketCre.png)
4. Set quyền cho Bucket
  ![S3](/Work-Shop/images/WS/S3/SetPolici.png)  
5.Chúng ta cần upload file index.html ở trên 
  ![S3](/Work-Shop/images/WS/S3/Upload.png) 
6. Upload thành công 
  ![S3](/Work-Shop/images/WS/S3/Uploaded.png) 
7. Cuộn xuống tìm Static web hosting và ấn **Edit**
  ![S3](/Work-Shop/images/WS/S3/EditSWH.png) 
8. Enable cho Static web hosting và file index.html
  ![S3](/Work-Shop/images/WS/S3/Enable.png) 
9. Trờ lại ấn vào Permission
![S3](/Work-Shop/images/WS/S3/Permission.png) 
10.SetPermission cho Policy cho ChatBox
![S3](/Work-Shop/images/WS/S3/SetPerm.png) 
11. Và cuối cùng trở lại file index.html và ta sẽ thấy đường link deploy thành công
![S3](/Work-Shop/images/WS/S3/Deploy.png) 
 

 #### Và đây là sản phẩm của chúng ta 
![S3](/Work-Shop/images/WS/S3/Product.png) 

