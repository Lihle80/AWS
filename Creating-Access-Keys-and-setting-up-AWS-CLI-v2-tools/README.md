# Creating Access keys and setting up AWS CLI v2 tools
Access keys are long-term credentials for an IAM user or the AWS account root user. Access keys are used through the CLI only. I will be creating these Access keys on aws, AWS documentation provides instructions on how to install CLI tools om Linux, Windows and Mac.

### Step 1: Creating Acces keys

- On the AWS console home screen click on the drop menu under the account name and select security credentials
![drop menu](https://github.com/Lihle80/AWS/blob/main/Creating-Access-Keys-and-setting-up-AWS-CLI-v2-tools/Images/1.png)

- under Access keys for CLI, SDK, & API access create an access key
![create access key](Creating-Access-Keys-and-setting-up-AWS-CLI-v2-tools/Images/2.png)

- download access keys csv and keep them somewhere secure
![access keys csv](Creating-Access-Keys-and-setting-up-AWS-CLI-v2-tools/Images/3.png)

:triangular_flag_on_post: **never share the secret access key for security reasons and best practices as well**
- Secret Access key cannot be retrieved if lost or misplaced
- If Secret Access key is lost you can delete the Access key and create a new one

### Step 2: Follow Links to install CLI tools on chosen OS
- Windows
```
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html
```

- Linux
```
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
```

- Mac
```
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
```
