#!/usr/bin/env gawk
###needs file 1 and file 2 as input, keeps from file 2 anything found in file 1
###file 1 will contain the blast output, file 2 will contain the list of reads to remove use awk -f (this file) file1 file2

####change fields to reflect the selection feilds as appropriate
BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	delete hash

	while (getline < file1) {
		hash[$1] = 1
		#hash["@"$1] = 1
		#print $1
	}

	while (getline < file2) {
		if (hash[$5] ==1) {
			print $0
			#getline < file2
			#print $0
			#getline < file2
			#print $0
			#getline < file2
			#print $0
		}
	}

	exit (0)
}
