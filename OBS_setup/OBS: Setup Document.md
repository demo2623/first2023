## OBS: Setup Document

Problem Statement: During the flight we are collecting Drone data and video on GCS and we can see the live data on e-GCS. We have need to store live stream on our remote server.

#### OBS installation

`sudo apt install ffmpeg`

`sudo apt install v4l2loopback-dkms`



`sudo add-apt-repository ppa:obsproject/obs-studio`

`sudo apt update`

`sudo apt install obs-studio`



![](/home/krahul/.config/marktext/images/2023-03-10-16-23-29-image.png) 

Select OBS Studio from the app selection section



![](/home/krahul/.config/marktext/images/2023-03-10-16-30-40-2obs.png)

Select Optimise for streaming , recording is secondary

![](/home/krahul/.config/marktext/images/2023-03-10-16-31-24-3obs.png)

Go settings and choose 

Stream > select Custom > rtmp://14.99.243.82/live

steam key : demo

![](/home/krahul/.config/marktext/images/2023-03-10-16-32-53-4obs.png)

In Audio setting disable all the settings as per the screenshot.



![](/home/krahul/.config/marktext/images/2023-03-10-16-33-30-5obs.png)

Click on Advanced > Network > 

Bind Ip : Default

Ticked : Dynamically change bitrate to manage congestion(Beta)

![](/home/krahul/.config/marktext/images/2023-03-10-16-34-47-6obs.png)

Click on '+' icon 

![](/home/krahul/.config/marktext/images/2023-03-10-16-35-06-7obs.png)

select Screen capture (Pipewire)

![](/home/krahul/.config/marktext/images/2023-03-10-16-35-51-8obs.png)

Then click on OK

Click on "Start Streaming"

Click on "Start Recording"



![](/home/krahul/.config/marktext/images/2023-03-10-16-42-41-9obs.png)

 Output setting are as per the above screen

![](/home/krahul/.config/marktext/images/2023-03-10-16-43-09-10obs.png)

Remove all the screens only keep 

"Scenes" , "Sources" and "Controls"

![](/home/krahul/.config/marktext/images/2023-03-10-16-46-10-11obs.png)



Final screen will be look like this.




