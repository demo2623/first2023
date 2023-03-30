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
imagePath="/home/deployement/MFO_IMAGES"

echo "Please enter file name with extension"
read oemImageName

declare -a trackingAntennaIPArr
trackingAntennaIPArr[0]="192.168.10.11"
trackingAntennaIPArr[1]="192.168.10.12"
trackingAntennaIPArr[2]="192.168.10.13"
echo "Please enter tracking antenna port number"
read trackingAntennaPort

# echo "Please enter number of laptop devices"
declare -a laptopIPArr
laptopIPArr[0]="192.168.10.21"
laptopIPArr[1]="192.168.10.22"
laptopIPArr[2]="192.168.10.23"

echo "Please enter starting port number for Laptop"
read laptopStartingPort

echo "Please enter number of images to be developed"
read swarmCount

# Loop Starts Here

for i in `seq 1 $swarmCount`
do
    mkdir oem
	./simg2img $imagePath/$oemImageName raw_oem.img
	sudo mount raw_oem.img oem
	sudo mkdir oem/etc
	for j in `seq 1 4`
	do
		if [ $j -eq 1 ]
		then
			mkdir temp
			cp -r mavlink-router.optimus.conf temp/			
			offset=1
			currentPort=$trackingAntennaPort
			echo "Tracking Antenna Current Port: $currentPort"
			echo "" >> temp/mavlink-router.optimus.conf
			qgc_gcs_number=`expr 2 + $j`
			echo "[UdpEndpoint qgc_gcs:${qgc_gcs_number}]" >> temp/mavlink-router.optimus.conf
			echo "Mode = normal" >> temp/mavlink-router.optimus.conf
			ip_index=`expr $i - $offset`
			echo "Address = ${trackingAntennaIPArr[$ip_index]}" >> temp/mavlink-router.optimus.conf
			echo "Port = $currentPort" >> temp/mavlink-router.optimus.conf
		else
			currentPort=`expr $laptopStartingPort + $i - 1`
			echo "Laptop Current Port: $currentPort"
			echo "" >> temp/mavlink-router.optimus.conf
			qgc_gcs_number=`expr 2 + $j`
			echo "[UdpEndpoint qgc_gcs:${qgc_gcs_number}]" >> temp/mavlink-router.optimus.conf
			echo "Mode = normal" >> temp/mavlink-router.optimus.conf
			offset=2
			ip_index=`expr $j - $offset`
			echo "Address = ${laptopIPArr[$ip_index]}" >> temp/mavlink-router.optimus.conf
			echo "Port = $currentPort" >> temp/mavlink-router.optimus.conf
		fi
		echo $j
	done

	sudo cp -r temp/mavlink-router.optimus.conf oem/etc/

  sleep 0.1
	sudo umount oem

	./img2simg raw_oem.img "ADR${i}_${oemImageName}"

	echo "Image $i Created"

	#Clean Up
	rm -rf oem
	rm -rf mFlightOne
	rm -rf raw_oem.img
	rm -rf temp
done

# Loop stops here
