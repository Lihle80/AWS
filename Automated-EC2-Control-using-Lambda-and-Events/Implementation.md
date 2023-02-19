# Automated EC2 Control using Lambda and Events"*"
I am going to be creating 2 EC2 instances and lambda functions to stop, start and protect those instances.

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
