# AWS Resume
Created a resume web application using AWS infrastructure.

https://d1lut3c2ipcmzp.cloudfront.net/

![test](https://github.com/DRDohvaken/aws-resume/assets/8603276/09739b31-4605-4307-b57a-6a48e8fe17f1)

## Step 1: Set up S3 Bucket and CloudFront

![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/da9b5cc6-5b62-420a-8bd2-605c376ba3a9)
This is where you will upload the files of your resume/static website.

Ensure block public access has been turned on. This will ensure that unauthorized users will not be able to access the S3 Bucket. This is one of the main forms of secret/confidential information leakage for AWS services.
- This will enable Bucket Policies to be used.

![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/74fac58a-842c-430e-8fd5-2f32f4b8ebaf)
Setup CloudFront, ensure that the origin is set to the S3 Bucket that we made earlier.
- Please note the 'Distributed domain name' this is what we will use to access the resume.
- Additionally, set the 'Default root object' to the index.html file (front page).

![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/9f80bd65-73f5-4b79-aa35-1a83b673f7a9)
A policy should have now been added to the Bucket policy of the S3.

Accessing your domain should now reflect your website.

## Step 2: Set up Lambda and DynamoDB



## Step 3: Set up Git repo and CI/CD for front-end of resume



## Step 4: Set up JavaScript to get resume view counter working

Adding the following to my script tag of the front page:
```javascript
fetch('https://hy5bs46l6s4u6voloin5yw2soq0qxxsu.lambda-url.ap-southeast-2.on.aws/')
.then(response => response.json())
.then((data) => {
	document.getElementById('replace').innerText = data
})
```
This will allow the Lambda function to be called by the Function URL.

