# Instructions to run script

## Local machine

1. First, you have to make sure you are in the folder where your `localscript_ubuntu.sh` script is located
2. Check if the script has permission to execute by using `ll`, if it doesn't have `-x` added then run `chmod +x localscript_ubuntu.sh`
3. Once the permission is changed, run the script and add your IP address after, like so `./localscript_ubuntu.sh <YOUR_IP>`

## VM instructions

Once everything was moved to your remote computer, you can SSH into your virtual machine using the following command `ssh -i <YOUR_KEY> ubuntu@<YOUR_IP>` 

1. In your home directory on your instance, you should see your `ubuntu_script` folder. Check whether the `script.sh` file has permission to execute, if not, use the `chmod +x ubuntu_script/script.sh` 
2. Check again, and if it has the `-x` added, you can run the `ubuntu_script/script.sh` to run the code
3. Once that is finished, you can just add your IP address into your browser and see the homepage. if you add `<IP>/notepad` you should see the etherpad page.