#!/bin/bash
set -e # Exit immediately if a command fails
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "MacOS detected" && ./scripts/install_macos.sh ;; 
  linux-android) ./scripts/install_termux.sh ;;
  linux*)
	  ID=$(cat /etc/os-release | grep ID)
	  case "$ID" in
		  *debian*)    echo "Debian-based distributrion detected..." && ./scripts/install_debian.sh ;;
		  *fedora*)    echo "Fedora-like OS";;
		  *)           echo "unknown: $ID";;
	  esac
	  ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
