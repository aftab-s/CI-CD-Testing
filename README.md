# CI-CD-Testing
Testing automated deployment approaches. 

The setup was made in the following steps :
### 1. Creation of EC2 Instance and setting it up
Create an EC2 instance with the required configuration. (t2.micro in this case with an Ubuntu AMI)
In the security group, add inbound rules for SSH, HTTP and HTTPS that allows traffic from anywhere (0.0.0.0/0)
Generate Key Pair or choose an existing one.

SSH into the EC2 instance -> (Make sure the terminal is opened in the directory where the instance key pair is downloaded)
Inside the EC2 instance, first run a system update by running :
##### $ sudo apt get update
##### $ sudo apt get upgrade -y
Install Apache2 webserver and Git.

##### $ sudo apt install apache2

##### $ sudo apt install git

Now you can access the folder "/var/www/html". 

### 2. Creating a git Repository 
Create a git repository in github. Add your project files into that directory by running the necessary commands.
Also have a remote setup ready between your local machine and the github repository.

##### $ git remote add origin <repo url>

### 3. EC2 Instance Configuration
Go to /var/www/html and setup remote access between your EC2 instance and the github repository. Pull the code from the repository created previously 
in github such that the files are now available inside the EC2 instance. Now create a file  deployment.sh (name it anything but make sure the extension is .sh)

##### $ sudo nano deployment.sh

Add the following code

#!/bin/bash
cd /var/www/html
git pull origin main
sudo systemctl restart apache2

(This file would be there in this repo)

Run this script

##### $ ./deployment.sh

Now whenever you create a change in your project locally, run this code inside the EC2 instance and automatically the changes will take effect in the deployment.
This is a straight-forward approach to automatic the deployments without the use of github actions.  
