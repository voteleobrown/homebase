#!/bin/bash
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;; 
  linux-android) ./scripts/install_termux.sh ;;
  linux*)   ./scripts/install_debian.sh ;;
  bsd*)     echo "BSD" ;;
  msys*)    echo "WINDOWS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac
