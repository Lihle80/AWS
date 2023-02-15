# Advanced Site-to-Site VPN
A site-to-site VPN tunnel encrypts traffic at one end and sends it to the other site over the public Internet where it is decrypted and routed on to its destination.

## The Setup
- 2 instances running a VPC
- 4 instances running in a seperate VPC simulating a on-premisis environment, 2 instances acting as Routers and the other 2 as servers

![picture1](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/1.-6-instances-have-been-created(4-represent-on-prem-infrastructure).png)

### Steps
- Navigate to VPC and create a Customer Gateway

![picture2](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/2.-s1-nav-to-VPC-and-create-CGW.png)
- 
