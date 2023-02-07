# VPC Interface Endpoint
VPC endpoints allow private connections from services in a VPC to AWS services running in the public network. Interface endpoints make use of ENI's(elastic network interface) to achieve this. I will be creating a VPC Interface Endpoint which will be used to send messages from an instance via sns.

### Create Interface Endpoint
- From an instance running in a VPC try and send a message via SNS using the following command
- ```aws sns publish --message "your favourite message" --phone-number enterphonenumberofreciever --region regionofinstance```

**_See Screenshot Below_**
![picture1](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/1.-cannot-send-message-via-sns-because-no-interface-gateway.png)
- Note how the operation is not completed hence we have to cancel the operation using ```ctrl+C```
- Navigate to _Endpoints_ and Select _Create Endpoint_
![picture2](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/2.-create-vpc-endpoint.png)
- Select _sns_ as service and select the VPC which contains your instance

**_See Screenshot Below_**
![picture3](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/3.-select-sns-and-interface-type-and-private-VPC.png)
- Select the Availibilty Zones used by the VPC and select the subnets to attech interface endpoints to.

**_See Screenshot Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/4.-select-AZ's-used-by-VPC-which-have-subnets-and-select-app-subnets.png)
- We wont be implementing this with private DNS so we will uncheck _Enable DNS name_ under _Additional settings_

**_See Screenshot Below_**
![picture5](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/5.-under-additional-uncheck-enable-dns-name.png)
- Select the Security which will apply to your interface endpoint and create endpoint
![picture6](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/6.-select-A4l-SG-.png)
![picture7](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/7.-endpoint-is-available-and-associated-with-VPC.png)
- Note we are still unable to send messages via sns because the command line tools still attempt to access the service with its original endpoint and not the interface endpoint
![picture8](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/8.-command-still-does-not-work-because-command-line-tools-attempt-to-access-service-with-its-original-endpoint-and-not-interface-endpoint-name-because-private-DNS-name-is-disabled.png)
- This can be overriden by appending command ``` --endpoint-url http interfaceendpointhere```
- you should work now

**_See Screenshot Below_**
![picture11](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/11.-this-seems-to-have-worked-but-one-final-config-is-required.png)

- One final Configuration is required before this setup is complete
- Navigate to SNS, under _Text Messaging_ add recipients numbe, select _Add phone number_

![picture12](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/12.-move-to-sns-under-text-messaging-add-phone-number.png)
- Once you have added the number messages will now be sent from your terminal

**_See Screenshot Below_**
![picture14](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/14.-message-has-been-sent-now-.png)

### Enable Private DNS
- Navigate to VPC and select the endpoint and select modify

**_See Screenshot Below_**
![picture15](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/15.-move-to-vpc-and-select-endpoint-and-select-modify.png)
- enable private DNS and save changes

**_See Screenchot Below_**
![picture16](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/16.-enable-private-DNS.png)
- Now we should be able to interact with the default service name and be able to send new messages

**_See Screenshot Below_**
![picture17](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/17.-now-we-should-be-able-to-interact-with-the-default-service-name-and-recieve-a-new-message.png)
