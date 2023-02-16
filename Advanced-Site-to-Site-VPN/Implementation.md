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

