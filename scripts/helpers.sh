#!/bin/bash

scripts_dir="$repo_dir/scripts/"

# Color constants
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

function log_info() {
  if [ -n "$1" ]
  then
      IN="$1"
  else
      read IN # This reads a string from stdin and stores it in a variable called IN
  fi
  printf "\n$GREEN[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] INFO: $IN  (($0))$NC\n"
}

function log_error() {
  if [ -n "$1" ]
  then
      IN="$1"
  else
      read IN # This reads a string from stdin and stores it in a variable called IN
  fi
  printf "\n$RED[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] ERROR: $IN  (($0))$NC\n"
}

function verify_command_exists() {
    log_info "Verifying shell command '$1' exists ..."
    if ! command -v "$1" &> /dev/null; then
        log_error "$1 could not be found! Aborting."
        exit 1
    fi
}
