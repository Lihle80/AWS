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
