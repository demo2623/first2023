#!/bin/bash
device_serial_number=$(adb devices | grep -v "List"  | awk '{print $1}')
device_attached_status=$(adb devices | grep -v "List"  | awk '{print $2}')

echo "Device Serial No: $device_serial_number"
echo "Attached Type:$device_attached_status"

if [[ $device_serial_number != "" ]]
then
	au_firmware_version=$(adb shell cat /oem/oem.prop | awk '{print $1}')
	echo "Fimware version is $au_firmware_version"
else 
	echo "it is not working";
fi
