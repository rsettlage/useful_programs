#!/usr/bin/env gawk
###needs file 1 and file 2 as input, removes from file 2 anything found in file 1
###file 2 will contain the blast output, file 1 will contain the list of reads to remove

BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	delete hash

	while (getline < file1) {
		#print $1"space"
		hash[$1] = 1
	}

	while (getline < file2) {
		#print $1"space"
		if (hash[$1]==1) {
			print $0
		}else{
			#print $0
		}
	}

	exit (0)
}
