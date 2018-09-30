#! /bin/sh
ls -lSAR |grep "^[d-]" | tr -s ' ' ' ' | cut  -d' ' -f1,5,9 | sort -rnk 2 | \ 
awk 'BEGIN{ total=0;dir_num=0;file_num=0}{ printf "%2d: %-15s %s\n", NR, $2, $3; ((total+=$2));}\
	/^d/{dir_num++} /^-/{file_num++}END{print "File num: ", file_num, "\nDir num: ", dir_num, "\nTotal: ", total}' \
	| grep --color=never "^[TDF ][^6-9]"
