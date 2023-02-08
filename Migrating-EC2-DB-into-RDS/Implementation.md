# Migrating EC2 Database into RDS
I will be migrating a database which runs on an EC2 instance and running it from RDS. I will be using the mysql engine to run the database.

### The Setup ☑️
- starting off with 2 instances
- One of the instances us running a simple wordpress application which uses a database running on the instance
- Second instance is the database of the application

![picture1](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/1.-the-Two-instances-one-is-DB-one-is-Wordpress-installed.png)

### Step 1
- Navigate to RDS and create a subnet group so we can specify which subnets our Database should run in
- Specify the needed details and select the VPC which corresponds with the subnets you want the database to run in

**_See Screenshot Below_**
![picture4](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/4.-choose-VPC.png)
- Select the Availibilty Zones and subnets you want to use for the Database

![picture5](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/5.-select-VPC-and-DB-subnets-then-create.png)
- Now we can create the database, select create database and select standard create and the mysql engine

![picture6](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/6.-create-database-use-mysql-engine.png)
- Enter the deatils needed
**_See Screenshot Below_**
![picture7](https://github.com/Lihle80/AWS/blob/main/Migrating-EC2-DB-into-RDS/images/7.-enter-details.png)
