#!/bin/sh

echo "Herelink OEM Image Creation begins"

#Checks
#If any command fails script crashes

#User Inputs:
# 1. Absolute path of input OEM image
# 2. Enter target IP address
# 3. Starting Port Number
# 4. Number of images

#echo "Please enter absolute path of OEM image with File name"
#read imagePath
imagePath="/home/deployment/MFO_IMAGES"


echo "Please enter file name with extension"
read oemImageName

#192.168.10.1
#192.168.43.51
echo "Please enter target IP address"
read targetIPAddress

echo "Please enter starting port number"
read startingPort

echo "Please enter number of images to be developed"
read swarmCount

# Loop Starts Here

for i in `seq 1 $swarmCount`
do
        currentPort=`expr $startingPort + $i`
        echo "Current Port: $currentPort"

	mkdir oem
	./simg2img $imagePath/$oemImageName raw_oem.img
	sudo mount raw_oem.img oem
	sudo mkdir oem/etc

	mkdir temp
	cp -r mavlink-router.optimus.conf temp/

	echo "" >> temp/mavlink-router.optimus.conf
	echo "[UdpEndpoint qgc_gcs:3]" >> temp/mavlink-router.optimus.conf
	echo "Mode = normal" >> temp/mavlink-router.optimus.conf
	echo "Address = $targetIPAddress" >> temp/mavlink-router.optimus.conf
	echo "Port = $currentPort" >> temp/mavlink-router.optimus.conf

	sudo cp -r temp/mavlink-router.optimus.conf oem/etc/

  sleep 0.1
	sudo umount oem
	
	#./img2simg raw_oem.img "TA_${oemImageName}_${currentPort}".img
	./img2simg raw_oem.img "ta_${oemImageName}"

	echo "Image $i Created"

	#Clean Up
	rm -rf oem
	rm -rf mFlightOne
	rm -rf raw_oem.img
	rm -rf temp
done
# Loop stops here
