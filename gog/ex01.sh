#!/bin/bash

#File size : 12569973
wc -c eswiki-20110420-category.sql

#Number of lines : 67
wc -l eswiki-20110420-category.sql

#Average line size : 185440
awk ' { thislen=length($0); totlen+=thislen} END { printf("average: %d\n", totlen/NR); } ' eswiki-20110420-category.sql






