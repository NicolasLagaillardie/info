#!/bin/bash

full=$(ls -R | awk -F'[_.]' '{print $2}' | sed 's/.*\/.*//' |sed '/^[[:space:]]*$/d'| sed 's/\(.*\)/\*\.\1/' | sort -u |while read FILENAME ; do find . -name "$FILENAME"  ; done | while read FILENAME ; do wc -l $FILENAME ; done)

suffixs=$(ls -R | awk -F'[_.]' '{print $2}' | sed 's/.*\/.*//' |sed '/^[[:space:]]*$/d' | sort -u)

index=0
choice=0
for i in $full
do
	if [ $choice -eq 0 ]; then
		lines[$index / 2]=$i	
		choice=1
	else
		path[$index / 2]=$i
		choice=0
	fi
	index=$(($index + 1))
done

echo $index

for i in $suffixs
do
	suffix=$(echo $i | cut -f 1- -d '.')
	somme=0
	for j in $(seq $index)
	do
		pathSuffix=$(echo ${path[$j]} | cut -f 3 -d '.')
		lines=${lines[$j]}

		if [ "$pathSuffix" = "$suffix" ]; then
			somme=$(expr $somme + $lines);
		fi
	done
	echo
	echo $somme
	echo $suffix
done

exit 0
