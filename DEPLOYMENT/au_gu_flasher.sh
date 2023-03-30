#!/bin/bash
device_serial_number=$(adb devices | grep -v "List"  | awk '{print $1}')
device_attached_status=$(adb devices | grep -v "List"  | awk '{print $2}')
echo "serial= $device_serial_number  and status = $device_attached_status"
flasher_path="/home/deployement/MFO_IMAGES"
#condtion1 will check serial number is empty or not
if [[ $device_serial_number == "" ]] && [[ $device_attached_status == "" ]];then
	echo "Device not found"
else
	echo "Flasher run for AirUnit and ground unit"
	echo "Press A for airunit"
	echo "Press G for ground unit"
	read userinput
	#condtion2 will check flasher_linux will run on which device
	if [[ $userinput == 'a' ]] || [[ $userinput == 'A' ]];then
		adb reboot bootloader
		sleep 6
		echo "Wait for 5 seconds bootloader process is on"
		sudo ./flasher_linux
		echo "air unit flashed successfully"		
	else 
		adb reboot bootloader
		sleep 6
		echo "Wait for 5 seconds bootloader process is on"
		./flasher_linux
		echo "Ground  Unit flashed successfully"
	fi
	#condition2		
fi
#condition1 
