# Setting up AWS Single Sign-On for On-premise Active Directory Users
### Introduction
AWS Single Sign-On (SSO) is a cloud-based service that makes it easy to centrally manage SSO access to multiple AWS accounts and business applications. In this guide, I will walk you through the process of setting up AWS SSO for on-premise Active Directory (AD) users.
### Prerequisites
**Before you can set up AWS SSO for on-premise Active Directory users, you must have the following:**
- An AWS account with administrative privileges
- An on-premise Active Directory domain with a trust relationship with the AWS Directory Service for Microsoft Active Directory
- A user account in the on-premise Active Directory that has permission to read and write to the AWS SSO directory

# Steps
### Set up the AWS SSO Directory
**The first step is to set up the AWS SSO directory. This is where you will manage your users and groups, and where you will define your SSO policies. To set up the AWS SSO directory, follow these steps:**
- In the AWS SSO console, choose the "Directories" tab.
- Choose "Add a directory", and then choose "AWS Managed Microsoft AD".
- Enter a name for the directory and choose "Add directory".
- Wait for the directory to be created, which can take up to an hour.
- Configure AWS SSO for On-premise Active Directory
**After you have set up the AWS SSO directory, you need to configure AWS SSO to use your on-premise Active Directory. To do this, follow these steps:**
- In the AWS SSO console, choose the "Settings" tab.
- Under "Identity source", choose "Add new identity source".
- Choose "On-premises" as the identity source type.
- _Enter the following information:_
- Active Directory domain name
- Active Directory NetBIOS name
- Domain controller IP address
- Service account username and password
- Choose "Test connection" to verify that AWS SSO can connect to your Active Directory domain.
- Choose "Add source" to add your Active Directory as an identity source.
- Assign Users to AWS SSO
**After you have configured AWS SSO to use your on-premise Active Directory, you need to assign your users to AWS SSO. To do this, follow these steps:**
- In the AWS SSO console, choose the "Users" tab.
- Choose "Add user", and then enter the user's name and email address.
- Choose "Create user".
- Choose the user you just created and choose "Edit".
- Choose "Assign access" and then choose the AWS accounts and roles that the user should have access to.
- Choose "Save changes" to assign the user to AWS SSO.
### Test Your Setup
**After you have assigned your users to AWS SSO, you should test your setup to ensure that it is working correctly. To do this, follow these steps:**
- Sign out of your AWS account.
- Go to the AWS SSO user portal URL that you specified when you set up AWS SSO.
- Enter your email address and password.
- Choose "Sign in".
- You should now be signed in to your AWS account.
# Conclusion
- In this guide, we have shown you how to set up AWS Single Sign-On for on-premise Active Directory users. By following these steps, you can centralize access to multiple AWS accounts and business applications, making it easier to manage access and ensure security across your organization.
