#!/bin/bash

echo "Start to download the projects.."

cd ~/

mkdir autoipsender

cd autoipsender

wget -v https://raw.githubusercontent.com/epicure1998/RaspberryPi-Autp-ip-sender-byEmail/master/pyfiles/demo.py

echo -n "Please input the sender email.."

read senderEmail

echo -n "Please input the SMTP authenticated key from sender email.."

read key

read -p "Use the Email address of sender as the receiver's address? Yes/No:" choose

if [ $choose = "yes" ] || [ ${choose} = "y" ];
then
 receiverEmail=$senderEmail 
 echo "Using the sender's email as receiver's email.."
else 
 read -p "Please input the receiver's email.." receiverEmail
fi

sed "13c msg_from='${senderEmail}' # Sender email address" demo.py
sed "14c passwd = '${key}' #  Sender's SMTP authenticated key" demo.py
sed "15c msg_to='${receiverEmail}' # Receiver email address" demo.py

sudo sed -i '/exit 0/d' /etc/rc.local

sudo echo "(" >> /etc/rc.local
sudo echo "exec /sbin/ifconfig wlan0 |addr= grep -o -E "inet [0-9.]+"|grep -o -E [0-9.]+|xargs python ~/autoipsender/demo.py " >> demo.txt; sudo echo ")&" >> etc/rc.local
sudo echo ")" >>/etc/rc.local
sudo echo "exit 0" >> /etc/rc.local

echo "finish.."