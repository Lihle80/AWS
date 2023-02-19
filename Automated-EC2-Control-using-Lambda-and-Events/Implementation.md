# Automated EC2 Control using Lambda and Events
I am going to be creating 2 EC2 instances and lambda functions to stop, start and protect those instances.

### Prerequisites
- 2 EC2 instances

## Steps
- create an a lambda execution role policy
```
{
"Version":"2012-10-17"
"Statement":[
  {
    "Effect":"Allow",
    "Action": [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resources":"arn:aws:logs:*:*:*"
  }
  {
    "Effect":"Allow",
    "Action": [
      "ec2:Start*",
      "ec2:Stop*"
    ],
    "Resources":"*"
  }
 ]
}
```
This Policy gives lambda permissions to...

- Navigate to I am and create a Role

![picture2](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/2.-nav-to-iam-and-create-execution-role.png)
- select "AWS Service Role"

![picture3](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/3.-AWS-service-role.png)
- select _"create policy"_, select JSON and add the policy above

![picture5](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/5.-select-JSON-and-enter-in-the-policy-we-created.png)
- then name the policy and create the policy
- Now move back to creating the role and select the policy you just created

![picture7](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/7.-back-to-role-creation%2C-select-new-policy.png)
- Name the Role and create it
- Navigate to EC2 and copy the each _"instance ID"_
- Navigate to lambda and _"create function"_
- enter function name and select the runtime for the function

![picture11](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/11.-select-function-name-and-runtime.png)
- select the execution role we created

![picture12](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/12.-select-execution-role-we-created.png)
- enter this code onto your function
```
import boto3
import os
import json

region = 'us-east-1'
ec2 = boto3.client('ec2',region_name=region

def lambda_handler(event, context):
    instance=os.environ['EC2_INSTANCES].split(",")
    ec2.start_instances(InstanceIds=instances)
    print('started instances: ' + str(instances))
```
