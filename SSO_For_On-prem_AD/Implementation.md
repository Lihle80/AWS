# Setting up AWS Single Sign-On for On-premises Active Directory Users

This guide will show you how to set up AWS Single Sign-On (SSO) with an on-premises Active Directory (AD) for secure access to AWS resources. By following these steps, you can grant your users secure access to AWS resources without the need for separate usernames and passwords.

## Prerequisites

Before you begin, make sure that you have the following:

- An AWS account with Administrator permissions.
- An on-premises Active Directory (AD) with domain administrator privileges.

## Step 1: Set up AWS SSO

1. Open the AWS SSO console.

2. Choose "Directory" on the left navigation menu.

3. Select "Add a new directory".

4. Select "Active Directory" and then click "Next".

5. Enter your on-premises AD directory details and then click "Next".

6. Choose the AD domain and OU that you want to use, and then click "Next".

7. Review the directory information and then click "Create directory".

## Step 2: Connect AWS SSO to Your On-premises AD

1. Open the AWS SSO console.

2. Choose "Directory" on the left navigation menu.

3. Select the on-premises AD directory that you created in Step 1.

4. Choose "Connect directory".

5. Review the prerequisites and then click "Next".

6. Enter your AD administrator credentials and then click "Next".

7. Choose the VPC that you want to use and then click "Next".

8. Review the connectivity information and then click "Connect directory".

## Step 3: Define Permission Sets in AWS SSO

1. Open the AWS SSO console.

2. Choose "Permission sets" on the left navigation menu.

3. Choose "Create permission set".

4. Enter a name and description for the permission set.

5. Choose the AWS accounts and applications that the permission set can access.

6. Click "Create".

## Step 4: Add Users to AWS SSO

1. Open the AWS SSO console.

2. Choose "Users" on the left navigation menu.

3. Create an AD group and add the users that you want to grant access to AWS SSO to the group.

4. Select the application to which you want to grant access.

5. Click "Assign users".

6. Select the AD group that you created in Step 3, and then click "Next".

7. Choose the type of access you want to grant, such as "Read only" or "Write".

8. Click "Next" to review the access summary.

9. Click "Finish" to complete the assignment process.

10. Repeat these steps for each AWS account or application that you want to assign users to.

## Step 5: Test the Configuration

After you have assigned users to AWS accounts and applications, you can test the configuration to ensure that it is working correctly. To do this, follow these steps:

1. Log out of the AWS SSO user portal.

2. Log back in using your on-premises AD credentials.

3. Click on "AWS accounts" or "Applications" on the left navigation menu to verify that you can access the resources that you were granted access to.



# Optional: Use AWS Managed Microsoft AD

Instead of using an on-premises AD, you can use AWS Managed Microsoft AD as your identity source for AWS SSO. To do this, follow these steps:

## Step 1: Create an AWS Managed Microsoft AD directory.

1. Open the AWS Management Console, navigate to the AWS Directory Service, and select "Directories" from the sidebar.

2. Click the "Create Directory" button, and select "AWS Managed Microsoft AD".

3. Choose the domain name for your AWS Managed Microsoft AD directory, and configure the directory settings.

4. Choose the VPC and subnets where you want to launch your AWS Managed Microsoft AD directory, and specify the administrative password.

5. Review the details and click "Create Microsoft AD".

6. Wait for the directory status to become "Active" before proceeding to the next step.

## Step 2: Connect your AWS SSO instance to your AWS Managed Microsoft AD directory.

1. In the AWS SSO console, select the "AWS accounts" tab.

2. Under "Identity source", select "AWS Managed Microsoft AD".

3. Enter the DNS name of your AWS Managed Microsoft AD directory, which you can find in the AWS Directory Service console.

4. Enter the credentials of an AWS Managed Microsoft AD user that has permissions to create trust relationships. This user must be in the "Administrators" group of your AWS Managed Microsoft AD directory.

5. Follow the prompts to complete the connection. 

## Step 3: Add users and groups to your AWS Managed Microsoft AD directory, and then assign them permission sets in the AWS SSO console.

1. In the AWS SSO console, navigate to the "Users and groups" tab.

2. Select "Add user", and enter the details for the user.

3. To add groups, select "Add group", and enter the details for the group.

4. Select the "Permission sets" tab, and select the permission set you want to assign to the user or group.

5. Click "Assign access", and select the user or group.

Congratulations, you can now use AWS Managed Microsoft AD as your identity source for AWS SSO!
