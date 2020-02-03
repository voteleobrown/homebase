#!/bin/bash
if test ".$" = ".off" ; then
	printf '\033%%@'
else 
	printf '\033%%G'
fi
