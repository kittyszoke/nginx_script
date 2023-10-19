#!/bin/bash

#We want to send 1st bash and index into our remote server
#Check if arg is sent
if [[ $# > 0 ]]
then 
    echo "There's an Argument!"
    REMOTE_IP=$1 
else
    echo "There's no argument :( "
    echo "Please supply IP"
    #read is a special word that prompts input from the user storing it in var called REMOTE_IP
    read REMOTE_IP
    #exit 1
fi

#First we need an IP of a remote server
#REMOTE_IP=$1

#Then we need to use secure copy to send the 2 files into the server
scp -i ~/.ssh/CH10_kitty_ie_general.pem -r ubuntu_script ubuntu@$REMOTE_IP:


#Run the scripts once the files have been copied 
ssh -i ~/.ssh/CH10_kitty_ie_general.pem ubuntu@$REMOTE_IP cd ~/ubuntu/ubuntu_script
ssh -i ~/.ssh/CH10_kitty_ie_general.pem ubuntu@$REMOTE_IP sudo chmod +x ubuntu_script.sh
ssh -i ~/.ssh/CH10_kitty_ie_general.pem ubuntu@$REMOTE_IP sudo ./ubuntu_script.sh