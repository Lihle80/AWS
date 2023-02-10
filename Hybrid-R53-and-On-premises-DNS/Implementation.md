# Hybrid R53 and On-premisis DNS
I am going to implement a hybrid DNS. A direct connect will be simulated with a VPC peer, 3 EC2 instances will simulate the om-premisis environment, 2 will simulate the DNS servers ans 1 will simulate the application server. I will configure R53 endpoints and on-prem DNS servers then verify we can reslove the endpoints, then configure outbound endpoints and verify we can resolve them as well.

### The Setup ☑️
![picture1](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/1.-created-instances-which-run-in-seperate-VPC's.png)
- 2 instances running in their own VPC, these simulate AWS environment
- 3 instances running in their own VPC which simulate the on-premisis environment

# Steps 🐾
- We Will firstly check if there is a connection between the on-premisis environmt and AWS environment
- We will firstly copy the private IP of the on-premisis instance running the application and attempt to ping it

**_See Screenshot Below**_
![picture2](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/2.-copied-on-prem-app-instance-private-ip.png)
- run ```ping {instance IP}``` on the terminal of any of the AWS instances to check if there is a connection

**_See Screenshot Below_**
![picture3](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/3.-cannot-ping-app-instance-from-aws.png)
- There is no connection from AWS to the on-premisis servers
- We will now do the opposite and attempt to ping from the on-premisis servers to the AWS servers

**_See Screenshots Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/4.-copied-aws-instance-private-ip.png)
![picture5](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/5.-cannot-ping-aws-servers-from-on-prem-server.png)
- **Now we are going to simulate the Direct Connect**
- Naviagate to VPC and create a Peering connection

![picture6](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/6.-nav-to-VPC-and-create-a-VPC-peering.png)
- select the 2 VPC's to peer

![picture7](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/7.-Select-2-VPC's-to-peer.png)
- Both VPC's belong to the same account so we can accept the connection ourselves

![picture8](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/8.-accept-peering-connection.png)
- Now edit the route tables for both AWS and on premisis VPC's
- Select the VPC you want to edit and go to _routes_ and select _edit routes_ 

![picture9](https://github.com/Lihle80/AWS/blob/main/Hybrid-R53-and-On-premises-DNS/images/9.-edit-on-prem-and-aws-Route-table-to-point-at-each-other.png)
- For the on-premisis VPC route table enter the IP of the AWS environment VPC and select Peering Connection as _Target_
- For AWS VPC route table enter the on-premisis VPC IP and select Peering Connection as _Target_
