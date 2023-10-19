#!/bin/bash

#Adding user
sudo useradd instructor

#Setting up password


#Install Apache
sudo yum install -y httpd

#Install git
sudo yum install -y git

#Move html file into html
sudo mv ~/ec2-user/aws_script/index.html /var/www/html

#Adding extra details for webpage
ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

echo "<p>My IP address is $ip4 </p>" >> /var/www/html/index.html
echo "<p>My opeting system is $OSTYPE </p>" >> /var/www/html/index.html
echo "<p>My webserver is Apache</p>" >> /var/www/html/index.html

#Restart Apache
sudo systemctl stop httpd
sudo systemctl start httpd

#Install NodeJs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install node

#Install etherpad
cd
sudo git clone --branch master https://github.com/ether/etherpad-lite.git &&
cd etherpad-lite &&
src/bin/run.sh

#Installing NGINX
sudo amazon-linux-extras install -y nginx1

#replacing nginx configuration
sudo mv aws_script/nginx.conf /etc/nginx/

#Restart Nginx server
sudo systemctl stop nginx
sudo systemctl start nginx