#!/bin/bash


for f in $*
do
	fullfilename=$f

	result=$(cat "$fullfilename" | grep "^INSERT\+[[:space:]]\+" | head -n 1 | sed 's/.*(\(.*\))/\1/g' | grep -o ',.*,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+,[[:digit:]]\+' | cut -f2 -d ',' | grep -v '\\$' | grep "'.*'" | sed "/\\'/! s/.*'\(.*\)'/\1/g" )

	echo "${result:1: -1}"

done


