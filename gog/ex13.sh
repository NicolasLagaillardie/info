#!/bin/bash


for f in $*
do
	fullfilename=$f

	modifiedFileNameBefore=$(echo "$fullfilename" | awk -F 'categorylinks' '{print $1}')
	modifiedFileNameAfter=$(echo "$fullfilename" | awk -F 'categorylinks' '{print $2}')
	modification="categoryGraph1"

	content=$(cat "$fullfilename" | sed 's/.*(\(.*\))/\1/' | grep -o '.*subcat')

	catFils=$(echo "$content" | cut -f -1 -d ',')

	catPere=$(echo "$content" | cut -f -2 -d ',')

	echo "$catFils" "$catPere" | grep -o ".*'$" | grep -o "^[[:digit:]].*"
  > "$modifiedFileNameBefore$modification$modifiedFileNameAfter"

done
