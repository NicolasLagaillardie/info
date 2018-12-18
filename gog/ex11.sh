#!/bin/bash


for f in $*
do
	fullfilename=$f

	modifiedFileNameBefore=$(echo "$fullfilename" | awk -F 'category' '{print $1}')
	modifiedFileNameAfter=$(echo "$fullfilename" | awk -F 'category' '{print $2}')
	modification="categoryIdName"

	tempFirst=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/' | grep -o ',.*,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+' | sed "s/\\\'/'/g")

	tempSecond=$(echo "$tempFirst" | sed 's/\\\"/"/g')

	tempThird=$(echo "$tempSecond" | sed 's/\\\\/\\/g')

	categorieName=$(echo "$tempThird" | cut -f2 -d ',' | grep -v '\\$' | grep "'.*'" | cut -f2 -d "'")



	tempFirst=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/' | grep ',.*,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+' | sed "s/\\\'/'/g")

	tempSecond=$(echo "$tempFirst" | sed 's/\\\"/"/g')

	tempThird=$(echo "$tempSecond" | sed 's/\\\\/\\/g')

	categorieNumber=$(echo "$tempThird" | cut -f1 -d ',')


	echo "$categorieNumber" "$categorieName"> "$modifiedFileNameBefore$modification$modifiedFileNameAfter"

done




