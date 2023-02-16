# Advanced Site-to-Site VPN
A site-to-site VPN tunnel encrypts traffic at one end and sends it to the other site over the public Internet where it is decrypted and routed on to its destination.

## The Setup
- 2 instances running a VPC
- 4 instances running in a seperate VPC simulating a on-premisis environment, 2 instances acting as Routers and the other 2 as servers

![picture1](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/1.-6-instances-have-been-created(4-represent-on-prem-infrastructure).png)

### Steps
- Navigate to VPC and create a Customer Gateway

![picture2](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/2.-s1-nav-to-VPC-and-create-CGW.png)
- Select a private BGP ASN within the given range and enter the on-premisis router IP
- do the same for both routers

**_See Screenshots Below_**
![picture3](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/3.-CGW-for-on-prem-router(use-Public-IP-of-on-prem-router).png)
![picture4](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/4.-do-the-same-for-router-2(BGP-can-be-anything-in-a-specified-range).png)
- Customer Gateways Successfully created

![picture5](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/5.-CGW's-successfully-created.png)
- Create a Transit Gateway and attech it to the VPC
- attechment created

![picture6](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/6.-TGW-created-and-atteched-to-VPC%2C-create-more-attechments-to-on-prem-routers.png)
- Create a Transit gateway Attechment and select the VPN attechment type

![picture7](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/7.-select-TGW-and-select-VPN.png)
- select an existing customer gateway and specify its ID and enable Global Accelerator
- do the same for the other router as well

![picture8](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/8.-select-on-prem-router1-and-enable-accelerator.png)
- Attechments creating

![picture9](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/9.-do-the-same-for-router-2-and-the-result-is-site-to-site-VPN-connections-creation.png)
- Move to Customer Gateways so we can use the Customer Gateway ID's to identify the site-to-site connections

![picture10](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/10.-move-to-customer-gateway-and-this-will-allow-us-to-tell-which-site-to-site-connection-is-which-by-matching-Customer-gateway-ID's.png)
- Navigate to site-to-site VPN connections, select a connection and download configurations. These are connection configurations for each connection

![picture12](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/12.-do-the-same-for-router-2-(these-contain-connection-config-of-each-VPN-connection).png)
- do the same for the other connection as well
- We need to extract information from those configuration files so we can configure our VPN connections
- follow the ![Link](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/DemoValueTemplate.txt) and extract the information onto this file, this simply makes the process for configuring our VPN tunnels simpler when we have all the values we need in one place.
- when the information is successfully extracted in the onto the file it will look something like this

![picture14](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/14.-info-successfuly-extracted.png)
- Navigate to EC2 and connect to Router1

![picture15](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/15.-connet-to-router-1-and-config-it.png)
- 

