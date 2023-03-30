#!/bin/bash
echo "Please enter file name"
read filename 
echo "file copying on Desktop"
adb pull /sdcard/$filename.mp4 /home/deployment/Desktop 
adb shell rm /sdcard/$filename.mp4
echo "file copied on desktop"
