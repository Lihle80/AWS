# VPC Interface Endpoint
VPC endpoints allow private connections from services in a VPC to AWS services running in the public network. Interface endpoints make use of ENI's(elastic network interface) to achieve this. I will be creating a VPC Interface Endpoint which will be used to send messages from an instance via sns.

### Create Interface Endpoint
- From an instance running in a VPC try and send a message via SNS using the following command
- ```aws sns publish --message "your favourite message" --phone-number enterphonenumberofreciever --region regionofinstance```

**_See Screenshot Below_**
![picture1](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/1.%20cannot%20send%20message%20via%20sns%20because%20no%20interface%20gateway.png)
- Note how the operation is not completed hence we have to cancel the operation using ```ctrl+C```
- Navigate to _Endpoints_ and Select _Create Endpoint_
![picture2](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/2.%20create%20vpc%20endpoint.png)
- Select _sns_ as service and select the VPC which contains your instance

**_See Screenshot Below_**
![picture3](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/3.%20select%20sns%20and%20interface%20type%20and%20private%20VPC.png)
- Select the Availibilty Zones used by the VPC and select the subnets to attech interface endpoints to.

**_See Screenshot Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/4.%20select%20AZ's%20used%20by%20VPC%20which%20have%20subnets%20and%20select%20app%20subnets.png)
- We wont be implementing this with private DNS so we will uncheck _Enable DNS name_ under _Additional settings_

**_See Screenshot Below_**
![picture5](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/5.%20under%20additional%2C%20uncheck%20enable%20dns%20name.png)
- Select the Security which will apply to your interface endpoint and create endpoint
![picture6](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/6.%20select%20A4l%20SG%20.png)
![picture7](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/7.%20endpoint%20is%20available%20and%20associated%20with%20VPC.png)
- Note we are still unable to send messages via sns because the command line tools still attempt to access the service with its original endpoint and not the interface endpoint
![picture8](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/8.%20command%20still%20does%20not%20work%20because%20command%20line%20tools%20attempt%20to%20access%20service%20with%20its%20original%20endpoint%20and%20not%20interface%20endpoint%20name%20because%20private%20DNS%20name%20is%20disabled.png)
- This can be overriden by appending command ``` --endpoint-url http interfaceendpointhere```
- you should work now

**_See Screenshot Below_**
![picture11](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/11.%20this%20seems%20to%20have%20worked%20but%20one%20final%20config%20is%20required.png)

- One final Configuration is required before this setup is complete
- Navigate to SNS, under _Text Messaging_ add recipients numbe, select _Add phone number_

![picture12](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/12.%20move%20to%20sns%2C%20under%20text%20messaging%20add%20phone%20number.png)
- Once you have added the number messages will now be sent from your terminal

**_See Screenshot Below_**
![picture14](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/14.%20message%20has%20been%20sent%20now%20.png)

### Enable Private DNS
- Navigate to VPC and select the endpoint and select modify

**_See Screenshot Below_**
![picture15](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/15.%20move%20to%20vpc%20and%20select%20endpoint%2C%20and%20select%20modify.png)
- enable private DNS and save changes

**_See Screenchot Below_**
![picture16](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/16.%20enable%20private%20DNS.png)
- Now we should be able to interact with the default service name and be able to send new messages

**_See Screenshot Below_**
![picture17](https://github.com/Lihle80/AWS/blob/main/VPC-Endpoint-Interface/images/17.%20now%20we%20should%20be%20able%20to%20interact%20with%20the%20default%20service%20name%20and%20recieve%20a%20new%20message.png)
