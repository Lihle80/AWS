# Advanced Site-to-Site VPN
A site-to-site VPN tunnel encrypts traffic at one end and sends it to the other site over the public Internet where it is decrypted and routed on to its destination.

## The Setup
This [Link](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://learn-cantrill-labs.s3.amazonaws.com/aws-hybrid-bgpvpn/BGPVPNINFRA.yaml&stackName=ADVANCEDVPNDEMO) will setup everything needed for this demo via cloudformation

### Implementation
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
- follow the [Link](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/DemoValueTemplate.txt) and extract the information onto this file, this simply makes the process for configuring our VPN tunnels simpler when we have all the values we need in one place.
- when the information is successfully extracted in the onto the file it will look something like this

### Configuring Routers
![picture14](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/14.-info-successfuly-extracted.png)
- Navigate to EC2 and connect to Router1

![picture15](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/15.-connet-to-router-1-and-config-it.png)
- run ```cd /home/ubuntu/demo_assets```
- this will change your directory and then edit the ipsec files, enter the information we extracted as labelled in the ipsec.conf and ipsec.secrets files

![picture16](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/16.-config-files-.png)
- move all files to /etc directory and then give executable permissions to the ipsec script
- run ```cp ipsec* /etc``` to copy all files beginning with ipsec to /etc
- then run ```chmod +x /etc/ipsec-vti.sh``` to give executable permissions to ipsec-vti file
- restart strongswan by running ```systemctl restart strongswan```
- run ```ifconfig``` to confirm that new interfaces have been created, which confirms that configuration is successful

![picture19](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/19.-confirmation-that-config-was-successful(do-the-same-for-router-2).png)
- **do this for both routers**
### Implementation Continued...
- Navigate to VPC site-to-site connections and select a connection, under tunnel details it should tell you if the tunnel is up or down 

![picture20](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/20.-nav-to-VPC-under-s2s-connections-select-a-connection-and-check-tunnel-details(under-details)-should-tell-you-if-IPsec-tunnel-is-up-or-down.png)
- Connect to the on-premisis router and run the following script as follows

![picture21](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/21.-open-on-prem-router-and-install-package(do-the-same-for-the-second-router).png)
- naviagate to ```/var/snap/amazon-ssm-agent/6312```
- then run```vtysh```
- configure BGP as shown below

**_See Screenshot Below_**
![picture22](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/22.-configure-BGP-on-routers.png)
- do this for both routers
- move back to VPC site-to-site connections and select a connection and check if it is up

![picture23](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/23.-under-s2s-you-can-see-that-BGP-is-Up-and-there-are-2-connections.png)
- connection is now up

### Test
- Connect to AWS instance and ping On-premisis instance via its private IP

![picture26](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/26.-ping-success(do-the-same-from-the-other-side-now).png)
- ping success ✔️
- do the same from the on-premisis environment

![picture27](https://github.com/Lihle80/AWS/blob/main/Advanced-Site-to-Site-VPN/images/27.-ping-success.png)
- ping success ✔️


