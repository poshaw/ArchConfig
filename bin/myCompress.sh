#! /bin/bash

# echo "test.txt" | cut -d'.' -f 1

if [[ $# -ne 1 ]]; then
	echo "must specify target file:  run.sh INFILE"
	exit 1
fi

if [[ ! -f $1 ]]; then
	echo "infile not found"
	exit 1
fi

STEM="$(echo $1 | cut -d'.' -f 1)"

tar cf - $1  -P | pv -s $(du -sb $1 | awk '{print $1}') | gzip > "$STEM"_"$(date +"%Y%m%d%H%M")".tar.gz
