+++
title = "Deploy Frontend Chat UI to an S3 Static Website"
date = 2021
weight = 7
chapter = false
pre = "<b>7. </b>"
+++

We will proceed to deploy this website.

#### Write interface code for chatbox

1. First, we need to create an index.html file so we can easily deploy to S3
   + Open your IDE and create file **Index.html**.
    - Then refer to the code below: 
    https://github.com/Tanhoccode/UI/blob/master/index.html

2. Then, we go to S3 to create a Bucket
     ![S3](/Work-Shop/images/WS/S3/Bucket.png)

3. Create Bucket
     ![S3](/Work-Shop/images/WS/S3/BucketCre.png)
4. Set permissions for Bucket
  ![S3](/Work-Shop/images/WS/S3/SetPolici.png)  
5. We need to upload the index.html file above
  ![S3](/Work-Shop/images/WS/S3/Upload.png) 
6. Upload successful
  ![S3](/Work-Shop/images/WS/S3/Uploaded.png) 
7. Scroll down to find Static web hosting and click **Edit**
  ![S3](/Work-Shop/images/WS/S3/EditSWH.png) 
8. Enable Static web hosting and index.html file
  ![S3](/Work-Shop/images/WS/S3/Enable.png) 
9. Go back and click on Permission
![S3](/Work-Shop/images/WS/S3/Permission.png) 
10. Set Permission Policy for ChatBox
![S3](/Work-Shop/images/WS/S3/SetPerm.png) 
11. And finally go back to the index.html file and we will see the successful deployment link
![S3](/Work-Shop/images/WS/S3/Deploy.png) 
 

 #### And here is our product 
![S3](/Work-Shop/images/WS/S3/Product.png)
