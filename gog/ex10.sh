#!/bin/bash


for f in $*
do
	fullfilename=$f

	modifiedFileNameBefore=$(echo "$fullfilename" | awk -F 'category' '{print $1}')
	modifiedFileNameAfter=$(echo "$fullfilename" | awk -F 'category' '{print $2}')
	modification="categoryIdName"

	lines=$(cat "$fullfilename" | grep -o '.*subcat' )

	categorieNumber=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/' | grep ',.*,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+' | cut -f1 -d ',')

	echo "$categorieNumber" "$categorieName"> "$modifiedFileNameBefore$modification$modifiedFileNameAfter"

done
