#!/bin/bash

# routeros6 
cat siteuri_interzise_betting.txt siteuri_interzise_oct_2024.txt | while read i; do
	echo "add address=127.0.0.1 name=$i ttl=120m";
	
	# is 2nd domain
	t=$(echo -n $i | cut -d '.' -f3)
	if [ "$t" = "" ]; then
		echo "add address=127.0.0.1 regexp=".*.$i" ttl=120m";
	fi
done
