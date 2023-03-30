#!/bin/bash
echo "Please enter file name"
read filename 

adb shell screenrecord /sdcard/$filename.mp4
echo "file created on Desktop"
