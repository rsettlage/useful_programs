#!/usr/bin/env gawk
###needs file 1 and file 2 as input, appends file 1 reads to file 2 reads, should I add some N's???
### awk -f (this file) file1 file2 >combined_R1R2.fasta

####change fields to reflect the selection feilds as appropriate
BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	while (getline < file1) {
			print $0
			getline < file2
			getline < file1
			printf("%s",$1)
			getline < file2
			printf("%s\n",$1)
			getline < file1
			getline < file1
			getline < file2
			getline < file2

	}

	exit (0)
}
