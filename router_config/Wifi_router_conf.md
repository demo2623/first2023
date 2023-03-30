## OBS: Auto Connect Coral with TP Link Router

#### Problem Statement:

Our coral for tracking antenna creates hotspot. At the same time it is not able to connect with Wifi (TPLink Router)   

#### Prequisite:

Hardware: Wirelsess keyboard and mouse.

 OR

ssh connection:

step 1: Connect the coral in the same network.

step 2: type ssh mendel@192.168.10.11 

step 3: enter password : mendel

#### Steps For Coral Configuration for Auto Connect'

How to access coral Interface?

$ ssh mendel@192.168.10.11 

Step1. Open terminal in coral and run following commands 

```
$sudo nano /etc/netwok/interfaces
sudo nano /etc/hostapd/hostapd.conf
reboot
```

comment all the codes written inside the above files.

type command 

 $nmtui

Choose

Activate Connection

SSID : MR/MR10_X8/23/18    

Mode : Client

Security: 

select : WPA & WPA2 Personal

P@sswOrd@123

IPV4 Configuration <Automatic>

IPV6 Configuration <Automatic>

Ticked : Automatically connect 

Ticked : Available to all users

then click on OK

type 'reboot' command on terminal

Screenshot from 2023-03-09 18-12-12$reboot$

Verify the automatic connection is ready or not:

nmtui

#### MFO configuration:(Laptop)

Step1. Connect laptop with SSID MR/MR10_X8/23/19

Step2. Go to Settings  > Comm Links > Add > UDP  with listening port : 23001

#### Router Static IP Configuration

Steps: Open Browser and type ip address of router 

ex: 192.168.10.1 or 192.168.1.1

Enter Router password: P@sswOrd@123 

Advance Setting > Network > LAN Settings 
click on Add > Scan > modify the ip
**below address will be configured** 
Router ip: 192.168.10.1
Coral Tracking antenna ip: 192.168.10.11
Laptop Ip: 192.168.10.21
Remote Controller (Ground Unit) : 192.168.10.31

Follow using UI are as follows.

![](/home/deployment/.config/marktext/images/2023-03-09-18-11-09-image.png)

                

Connect router and click on Advanced > LAN Settings > Click on Add Button

Then click on "Scan" button 

We can see the list of editable ip will be displayed on the screen.

![](/home/deployment/.config/marktext/images/2023-03-09-18-12-31-image.png)

Select an ip and then edit as per the document and click on "Save" button

and after then reboot the router.
