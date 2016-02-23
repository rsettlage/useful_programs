#!/usr/bin/env gawk
###read through fasta file and header file, replace headers in fasta file with those in header file
###file1 is fasta file, file2 is list of headers
BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	getline < file2
	chromosome = $1
	currentstart = $2
	currentend = $3

	while (getline < file1) {
		reference = ">"chromosome
		if($1 == reference){
			print reference"_"currentstart"_"currentend
			getline < file2
			chromosome = $1
			currentstart = $2
			currentend = $3
		}else{
			print $0
		}
	}
	exit (0)
}