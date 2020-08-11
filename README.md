# Raspberry pi IP address auto sender
The idea was generated by changing the ip address under a wlan. When we are using the raspberry pi under a LAN, the ip address may be relocated when the router was broken, reboot, or thing may happend when some other devices use your IP address. The methods which find or get the ip of Raspi are variable, several methods are listed below:
* the "IP scanner" from windows devices
* the "Lan scan" on mac OS which has an "augly duck" logo.
* several IP scaning apps in Android devices or iphone devices

However, all these methods above all work on a similar or a same way: Scanning all the IP address under the LAN. Nothing will happend, If the number of connecting divices is limited under th LAN, and you will find the IP address of your Raspberry pi or your linux devices very soon, but please try to imagine what if the LAN that we are using is a bigger one or a Class A ip address, then the process of getting your ip address by using the "scanning apps" like "Ip scanner" will waste your much time.

Therefore, an requirement that the Raspberry pi can tell us its ip address once it reboot is necessary to be achieved.

**If you are tired of reading "cliche" from mine below，you can directly execute the "autoIpsender.sh" file in your Raspi** 

[link](#link)

## Prerequisites
* Python 3 or 2.7
* Raspberry pi 3b+ or a device with linux kernel os
## Start

1. Open the python file "**demo.py**", and change the sender and reciever, then input the SMTP protocal authenticated key of the sender's email (The authen-key can be gained by asking your email server, for instance, the key in qq mail can be easily received by verifying your phone number)

   ![pic2](pics/pic1.png)
2. After that we create a directory on our raspi 
```
mkdir ~/autoIpSender
```
3. Then we need to find out a suitable bash commend for greping out or ip address. 
```
ifconfig wlan0 | grep -o -E "inet [0-9.]+"| grep -o -E [0-9.]+
```
![pic2](pics/pic2.png)
The result was diplayed above.

4. Passing the ip address which was found out from step 3 to our python file.
```
$ /sbin/ifconfig wlan0 |addr= grep -o -E "inet [0-9.]+"|grep -o -E [0-9.]+|xargs python /home/pi/autoIpSender/demo.py
```
before moving into next step, it would be better if we test on commend line at first.
5. Finally, we should add bash line into the **etc/rc.local** to ensure it will be executed after booting the raspi. 

  ![pic3](pics/pic3.png)

### <span id="link">link:</span>

``` 
wget https://raw.githubusercontent.com/epicure1998/RaspberryPi-Autp-ip-sender-byEmail/master/shellScripts/autoInstall.sh |bash
```

