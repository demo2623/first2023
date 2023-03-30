#!/bin/sh
echo "Deployment System preparation"
sudo usermod -aG plugdev $USER
echo "Rules file copying.."
sudo cp -r 90-herelink.rules  /etc/udev/rules.d
echo "Wait adb adb and fastboot is installing"
sleep 5
#Here installing abd and fastboot
sudo apt install android-tools-adb android-tools-fastboot -y --fix-missing
sudo apt-get install curl
echo "Wait here for 5 second to verify adb and fastboot version"
sleep 5
echo "=======ADB version======"
adb --version
echo "========Fastboot version=======" 
fastboot --version
echo "Deployment system is ready"

