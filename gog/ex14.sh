#!/bin/bash


for f in $*
do
	fullfilename=$f

	modifiedFileNameBefore=$(echo "$fullfilename" | awk -F 'categorylinks' '{print $1}')
	modifiedFileNameAfter=$(echo "$fullfilename" | awk -F 'categorylinks' '{print $2}')
	firstFile="categoryGraph1"
	secondFile="categoryIdName"
	thirdFile="categoryGraph"

	join -11 -21 "$modifiedFileNameBefore$firstFile$modifiedFileNameAfter" "$modifiedFileNameBefore$secondFile$modifiedFileNameAfter" > "$modifiedFileNameBefore$thirdFile$modifiedFileNameAfter"

done
