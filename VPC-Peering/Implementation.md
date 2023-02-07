# VPC Peering
A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. I will demonstrate how to set one up between 2 VPC's.

### Step 1: The Setup ☑️
- 3 EC2 instances running in their own VPC

**_See Screenshot Below_**
![picture](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/1.-3-instances-running-in-3-different-VPC's.png)
- notice how you are unable to communicate with another instance because they live in their own VPC's, of which have no kind of connections at all
- ping is not working

**_See Screenshot Below_**
![picture2](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/2.-unable-to-ping-instance-in-VPC-B-from-VPC-A.png)

### Step 2: Create and Configure VPC 🔐 ☁️
- Navigate to VPC ```peering connections``` and select ```Create Peering Connection```
- Then select VPC _Requester_ and _Acceptor_

**_See Screenshot Below_**
![picture3](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/3.-nav-to-VPC-peering-connections-select,-create-connection-and-select-VPC-requester-and-acceptor.png)

- Accept VPC connection, since all VPC's are in the same account we can accept the connection ourselves

**_See Screenshot Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/4.-since-the-response-VPC-is-in-the-same-account-we-can-accept-connections-ourselves.png)

### Step 3: Configure Route Tables 🛣
- Navigate to Route Tables and find the route tables for the VPC's being connected
![picture5](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/5.-now-we-need-to-configure-Route-tables-for-both-VPCA-AND-VPCB.png)
- Edit the VPC route table for each VPC, enter the other VPC's IP address and set Peering connection as target

**_See Screenshot Below**_
![picture6](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/6.-edit-Route-table,-add-Ip-for-other-VPC-and-select-peering-connection-as-target.png)

### Step 4: Configure Security Group 🧱
- Navigate to Security groups and locate security group for the VPC's being connected
- Edit inbound rules of Security Groups
![picture7](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/7.-edit-inbound-rules-of-Security-Groups-VPCB-as-it-does-not-allow-ping.png)
- Since both VPC's are in the same region we can just reference them in the Security Groups

**_See Screenshot Below_**
![picture8](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/8.-since-both-VPC's-are-in-the-same-region-we-can-referene-the-security-group.png)

### Step 3: Confirmation ✔️
- Ping from instance in one VPC to the other now works

**_See Screenshot Below_**
![picture9](https://github.com/Lihle80/AWS/blob/main/VPC-Peering/images/9.-now-the-ping-works.png)
