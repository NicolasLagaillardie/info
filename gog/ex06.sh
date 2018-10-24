#!/bin/bash

for f in $*
do
	fullfilename=$f

	result=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/' | cut -d ',' -f1,2 --output-delimiter=$'\n')

	echo "$result"

done
