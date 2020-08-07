#!/bin/bash
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;; 
  linux-android) ./scripts/install_termux.sh ;;
  linux*)
	  ID_LIKE=$(cat /etc/os-release | grep ID_LIKE)
	  case "$ID_LIKE" in
		  *debian*)    echo "Debian-based distributrion detected..." && ./scripts/install_debian.sh ;;
		  *fedora*)    echo "Fedora-like OS";;
		  *)           echo "unknown: $ID_LIKE";;
	  esac
	  ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
