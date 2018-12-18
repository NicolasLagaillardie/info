#!/bin/bash


for f in $*
do
	fullfilename=$f
	
	size=`wc -c "$fullfilename" | cut -f1 -d' '`
	lines=`cat "$fullfilename" | wc -l | cut -f1 -d' '`
	average=`awk ' { thislen=length($0); totlen+=thislen} END { printf("%d", totlen/NR); } ' "$fullfilename"`

	echo $size $lines $average $fullfilename

done



