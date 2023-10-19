#!/bin/bash

#Used this for testing not neeeded to be run

ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

echo "<p>My IP address is $ip4 </p>" >> /var/www/html/index.html
echo "<p>My opeting system is $OSTYPE </p>" >> /var/www/html/index.html
echo "<p>My webserver is Apache</p>" >> /var/www/html/index.html
