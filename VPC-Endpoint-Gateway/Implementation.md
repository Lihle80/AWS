# VPC Gateway Endpoint
Gateway endpoints provide reliable connectivity to Amazon S3 and DynamoDB without requiring an internet gateway or a NAT device for your VPC. I will be demonstrating how to set up a Gateway endpoint which connects to S3

## Creating Gateway Endpoint
- We start off with a private instance(instance has no public IP)
![picture1](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/1.-private-instance-with-no-internet-connection(no-Public-IP).png)
- Ping does not work from inside instance because it cannot reach the internet
![picture2](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/2.-ping-does-not-work.png)
- Navigate to VPC and select _Endpoints_ then select _Create endpoint_
![picture3](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/3.-move-to-VPC-and-select-endpoints-and-create-gateway-endpoint.png)
- select _s3_ and _gateway_ type
![picture4](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/4.-select-s3-and-gateway-type.png)
- Select the route table associated with the subnet where the instance exists
![picture5](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/5.-select-RT.png)
- under _Policy_ set preferred policy
![picture6](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/6.-set-full-access.png)
- a Prefix list will be added to your Route table, navigate to your Route table to confirm

**_See Screenshot Below_**
![picture7](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/7.-prefix-list-added-to-RT.png)
- now we are able to connect to s3
- test this by listing buckets from instance
- ![picture8](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/8.-able-to-connect-to-bucket-using-endpoint-gateway.png) 
- One more test, there is a file stored in a S3 bucket i will attempt to copy it to the instance
![picture](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/the-bucket-with-file.png)
- run ```aws s3 cp {file-URI-in-bucket} {name-of-file-to-be-stored-on-instance}``` to copy file from S3 to instance

**_See Screenshot Below_**
![picture9](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Gateway/images/9.-copy-file-from-bucket-onto-instance.png)
