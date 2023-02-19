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

![picture7](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/7.-back-to-role-creation,-select-new-policy.png)
- Name the Role and create it
- Navigate to EC2 and copy the each _"instance ID"_
- Navigate to lambda and _"create function"_
- enter function name and select the runtime for the function

![picture11](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/11.-select-function-name-and-runtime.png)
- select the execution role we created

![picture12](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/12.-select-execution-role-we-created.png)
- enter paste this code into your function and deploy
```
import boto3
import os
import json

region = 'us-east-1'
ec2 = boto3.client('ec2',region_name=region

def lambda_handler(event, context):
    instance=os.environ['EC2_INSTANCES'].split(",")
    ec2.start_instances(InstanceIds=instances)
    print('started instances: ' + str(instances))
```

**_See Screenshot Below_**
![picture14](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/14.-paste-that-code-into-function-and-deploy.png)
- This code allows the lambda function to start instances
- Now create the lambda function which will be used to stop instances

![picture15](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/15.-create-function-for-stopping-instances.png)
- copy and paste this code to this neew function and deploy it

```
import boto3
import os
import json

region = 'us-east-1'
ec2 = boto3.client('ec2',region_name=region

def lambda_handler(event, context):
    instance=os.environ['EC2_INSTANCES'].split(",")
    ec2.stop_instances(InstanceIds=instances)
    print('stopped instances: ' + str(instances))
```

- Under _"Configuration"_  select _"Environment Variable"_

![picture18](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/18.-under-config-edit-environmental-variables.png)
- Create an Environmet Variable and paste both EC2 instane ID's, ensure there are no spaces between the 2 ID's the only thing seperating them should be a comma (,)

![picture19](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/19.-name-the-variable-according-to-the-name-in-th-code-and-paste-in-both-instance-ID's-without-spaces(do-the-same-for-both-functions).png)
- Do this for both functions
- Under Test create a new event and test the function

![picture20](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/20.-if-you-select-the-stop-function-and-click-on-test-and-test.png)
- If the test was a success the Test Logs should be as follows

![picture21](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/21.-logs-output.png)
- Navigate to EC2 to see if the instances are really stopped

![picture22](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/22.-Ec2-instances-are-stopped.png)
- EC2 instances Stopped
- Do the same for the start function
- Create a function which will recover stopped  instances
- Copy and paste this code into the function and deploy the function

```
import boto3
import os
import json

region = 'us-east-1'
ec2 = boto3.client('ec2',region_name=region

def lambda_handler(event, context):
    print("Event Recieved: " json.dumps(event))
    instance=[ event['detail']['instance-id'] ]
    ec2.start_instances(InstanceIds=instances)
    print('protected instance stopped - starting up instance: ' + str(instances))
```
- This code will read events from eventbridge, when an instance is stopped this function will be triggered and a the instance will be started again
- Navigate to EventBridge and _"create rule"_

![picture27](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/27.-nav-to-eventbridge-and-create-rule.png)
- Give the rule a name, Rule type should be rule with pattern

![picture28](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/28.-enter-rule-name.png)
- Select AWS events

![picture29](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/29.-select-AWS-events...-and-scroll-down-to-event-pattern.png)
- Enter the following

![picture30](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/30.-under-event-pattern-enter.png)
- Select the sample events

![picture31](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/31.-select-sample-events.png)
- Select Target

![picture32](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/32.-select-target.png)
- Create Rule
- Now Stop both instances

![picture34](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/34.-stopping-both-instances.png)
- instance auto starts up again
- and is Running

_**See Screenshots Below**_
![picture35](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/35.-instance1-auto-starts-on-its-own-because-of-rule.png)
![picture36](https://github.com/Lihle80/AWS/blob/main/Automated-EC2-Control-using-Lambda-and-Events/images/36.-instance-running.png)
