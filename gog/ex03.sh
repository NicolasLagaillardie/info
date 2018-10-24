#!/bin/bash

for f in $*
do
	fullfilename=$f

	size=`cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | wc -c`
	lines=`cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | wc -l`
	average=`cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | awk ' { thislen=length($0); totlen+=thislen} END { printf("%d", totlen/NR); } '`

	echo $size $lines $average $fullfilename

done
