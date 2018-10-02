#!/bin/bash

paths=$(ls -R | awk -F'[_.]' '{print $2}' | sed 's/.*\/.*//' |sed '/^[[:space:]]*$/d'| sed 's/\(.*\)/\*\.\1/' | sort -u |while read FILENAME ; do find . -name "$FILENAME"  ; done | while read FILENAME ; do wc -l $FILENAME ; done)

suffixs=$(ls -R | awk -F'[_.]' '{print $2}' | sed 's/.*\/.*//' |sed '/^[[:space:]]*$/d' | sort -u)
for i in $suffixs
do
	suffix=$(echo $i | cut -f 1- -d '.')
	somme=0
	for j in $paths
	do
		temp=$(echo $j | awk -F'[_.]' '{print $1 $3}')
		pathSuffix=$(echo $temp | cut -f 1)
		lines=$(echo $temp | cut -f 2)

		echo $lines $somme

		if [ "$pathSuffix" = "$suffix" ]; then
			somme=`expr $somme + $lines`;
		fi
	done
	echo
	echo $somme
	echo $suffix
done

exit 0
