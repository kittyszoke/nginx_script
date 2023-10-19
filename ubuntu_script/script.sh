#!/bin/bash

#Adding user
sudo useradd instructor

#Setting up password
#Couldn't find in script

#Install Apache
sudo apt install -y apache2

#Move config for ports
sudo mv /home/ubuntu/ubuntu_script/ports.conf /etc/apache2/ports.conf

#Move html file into html
sudo mv /home/ubuntu/ubuntu_script/index.html /var/www/html

#Adding requested details for IP address, OS and server
ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

echo "<p>My IP address is $ip4 </p>" >> /var/www/html/index.html
echo "<p>My opeting system is $OSTYPE </p>" >> /var/www/html/index.html
echo "<p>My webserver is Apache</p>" >> /var/www/html/index.html

#Restart Apache
sudo systemctl stop apache2
sudo systemctl start apache2

#Install NodeJs
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt -y install nodejs

#Install Etherpad / use npm install instead of running given script
cd ~/ubuntu_script/
git clone --branch master https://github.com/ether/etherpad-lite.git &&
cd etherpad-lite &&
npm install

#Custom command for etherpad. Make sure you give the right path WorkingDirectory=<PATH>/etherpad-lite
sudo mv /home/ubuntu/ubuntu_script/etherpad.service /etc/systemd/system

#Start etherpad
sudo systemctl start etherpad.service

#Installing NGINX
sudo apt install -y nginx

#Remove default file and symlink
cd /etc/nginx/sites-enabled
sudo unlink default
cd /etc/nginx/sites-available
sudo rm default

#Move reverse-proxy.conf and symlink
sudo mv /home/ubuntu/ubuntu_script/reverse-proxy.conf /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

#Restart Nginx server
sudo systemctl stop nginx
sudo systemctl start nginx