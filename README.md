# AWS Resume
Created a resume web application using AWS infrastructure.

https://d1lut3c2ipcmzp.cloudfront.net/

![test](https://github.com/DRDohvaken/aws-resume/assets/8603276/09739b31-4605-4307-b57a-6a48e8fe17f1)

## Step 1: Set up S3 Bucket and CloudFront



## Step 2: Set up Lambda and DynamoDB



## Step 3: Set up S3 Bucket and CloudFront



## Step 4: Set up Git repo and CI/CD for front-end of resume



## Step 5: Set up JavaScript to get resume view counter working

Adding the following to my script tag of the front page:
```javascript
fetch('https://hy5bs46l6s4u6voloin5yw2soq0qxxsu.lambda-url.ap-southeast-2.on.aws/')
.then(response => response.json())
.then((data) => {
	document.getElementById('replace').innerText = data
})
```
This will allow the Lambda function to be called by the Function URL.

