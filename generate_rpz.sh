#!/bin/bash

out=blacklist-moldova.rpz

rm -v $out;

cat >> $out <<EOF
\$TTL 3600
@ SOA localhost root.localhost. 1728139384 43200 3600 259200 300
 NS localhost.

; updated at $(date "+%d-%m-%Y %H:%M")
EOF

cat siteuri_interzise_betting.txt siteuri_interzise_oct_2024.txt | while read i; do
	echo "$i CNAME ." >> $out
	
	# is 2nd domain
	t=$(echo -n $i | cut -d '.' -f3)
	if [ "$t" = "" ]; then
		echo "*.$i CNAME ." >> $out
	fi
done

echo "finished!"
