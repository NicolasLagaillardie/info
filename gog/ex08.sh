#!/bin/bash

for f in $*
do
	fullfilename=$f

	result=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/' | grep -o ',.*,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+' | cut -f2 -d ',')

	echo "$result"

done
