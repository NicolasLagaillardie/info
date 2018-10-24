#!/bin/bash

for f in $*
do
	fullfilename=$f

	temp=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1)

	echo "$temp" | tee -a l1

done
