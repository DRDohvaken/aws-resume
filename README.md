# AWS Resume - IN PROGRESS
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

Create a new DynamoDB table. This is an unrelational database so it acts perfect to setup a view counter for our resume.
![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/c8a30c3d-59d4-458e-8825-4293d66b186b)
DynamoDB uses key:value pairs to store information. In our case we will set up the key to be 'id' which is set to 1 and then 'views' for the value which we will initiate to be 0. Mine is currently displaying 14 as I have visited my resume a few times.

Next, generate a Lambda function which will use Python. We will select to use a function URL which will be publicly accessible. *Ensure that CORS is enabled, we will explain this more soon*
![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/5cba2cc3-de57-459e-8311-e3db18bdc922)

Add the following python code to the function. This essentially increments the views by one each time the function URL is accessed as well as prints the result. This is what we will view on our resume.
```python
import boto3
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('cloudresume-test')
def lambda_handler(event, context):
    response = table.get_item(Key={'id':'1'})
    views = response['Item']['views']
    views = views + 1
    print(views)
    response = table.put_item(Item={
            'id':'1',
            'views': views
    })

    return views
```
![image](https://github.com/DRDohvaken/aws-resume/assets/8603276/f936b0f8-fd0f-4f38-8404-67c406ae3be9)
Ensure that the CORS 'Allow origin' is set to the Cloudfront domain. This ensures that the function will only be executed if the traffic originates from our resume.

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

## Step 5: Set up Terraform (IN-PROGRESS)

