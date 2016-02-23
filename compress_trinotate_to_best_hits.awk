#!/usr/bin/env gawk
###combine blast results using a list of headers as the key

####change fields to reflect the selection feilds as appropriate, file 1 is the header file, file 2 is the reference
####run sequentially to add multiple search results
BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	delete hash

	while (getline < file1) {
		hash[$1] = 1
		hash[$2] = $1
	}

	while (getline < file2) {
		if ($1 in hash==1) {
			print $1"\t"$6"\t"$3"\t"$14"\t"$15"\t"
		}else{
			print hash2[$1]"\t""\t""\t""\t""\t"
		}
	}

	exit (0)
}