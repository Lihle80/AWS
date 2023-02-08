# Migrating EC2 Database into RDS
I will be migrating a database which runs on an EC2 instance and running it from RDS. I will be using the mysql engine to run the database.

### The Setup ☑️
- starting off with 2 instances
- One of the instances us running a simple wordpress application which uses a database running on the instance
- Second instance is the database of the application

![picture1](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/1.-the-Two-instances-one-is-DB-one-is-Wordpress-installed.png)

### Steps 👣
- Navigate to RDS and create a subnet group so we can specify which subnets our Database should run in
- Specify the needed details and select the VPC which corresponds with the subnets you want the database to run in

**_See Screenshot Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/4.-choose-VPC.png)
- Select the Availibilty Zones and subnets you want to use for the Database

![picture5](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/5.-select-VPC-and-DB-subnets-then-create.png)
- Now we can create the database, select create database and select standard create and the mysql engine

![picture6](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/6.-create-database-use-mysql-engine.png)
- Enter the details needed

**_See Screenshot Below_**
![picture7](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/7.-enter-details.png)
- Select the instance type and storage type the database will run on

![picture8.1](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/8.-select-instance-type-and-storage-type.png)
- Select VPC and subnet group database will exist in

![picture9](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/9.-select-VPC-and-VPC-group.png)
- Restrict public access to VPC and create a Security Group or choose an existing one

![picture10](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/10.-restrict-public-access-to-the-database-and-create-sg.png)
- Expand Additional Settings and enter the database name under _initial database name_

![picture11](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/11.-Expand-Additional-config-and-enter-a-DB-name-then-create-DB.png)
- Create the instance, then select it and open the link to the Security group, edit the inbound rules of that security group
- under Type select _MYSQL_ 
- and we can reference the Security group of the database instance

**_See Screenshot Below_**
![picture13](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/13.-edit-inbound-rules-and-allow-the-sg-which-is-used-by-our-deployed-instances.png)
- Connect to the instance and run the following commands:
- ```mysqldump -h {host-of-database-IP} -u {database-username} -p {user-of-database-password} > {namefile}.sql```
- This command allows us to backup the database in a _.sql_ file
- ```mysql -h {database-Endpoint} -u {RDS-database-username} -p {password} < {file}.sql```
- This command uses the backed up database stored in the _.sql_ file and migrates the data to RDS

**_See Screenshot Below_**
![picture14](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/14.-connect-to-wordpress-instance-and-enter-following-commands.png)
- Now we have to point wordpress towards RDS
- we need to configure the _wp-config_ file
- Them we need to edit the database host inside the file

**_See Screenshots Below_**
![picture15](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/15.-have-to-point-wordpress-instance-to-RDS.png)
![picture16](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/16.-Change-this-to-This.png)

### The Test 🧪
- In order to Test if our implementation was a success we are going to stop the Database instance which previously hosted the database

![picture17](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/17.-In-order-to-test-stop-DB-instance-and-copy-IP-of-wordpress-instance.png)
- copy the wordpress instance IP and paste it in the browser
![picture18](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/18.-Architecture-implementation-success.png)
- Website is running properly, implementation success ✔️
