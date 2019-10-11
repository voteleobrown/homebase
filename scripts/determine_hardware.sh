#!/bin/bash


cpu_info_grep=$(cat /proc/cpuinfo | grep Raspberry)
case $cpu_info_grep in
	*"Raspberry Pi 3"*) echo "rpi3" ;;
	*) echo "unknown" ;;
esac
