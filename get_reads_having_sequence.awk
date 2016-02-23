#!/usr/bin/env gawk
###needs file 1 and sequence as input, will get headers of reads having the input sequence

BEGIN {
	#print ARGV[1]
	#print ARGV[2]
	file = ARGV[1]
	#print file
	targetSEQ = ARGV[2]
	#print targetSEQ

	while (getline < file) {
		header=$0
		#print $header
		getline < file
		sequence=$0
		#sequence=$1
		#print $sequence
		getline < file
		#optional=$0
		#print $optional
		getline < file
		#quality=$0
		#print $quality
		if (sequence==targetSEQ) {
			print header
			#print sequence
			#print targetSEQ
		}
	}

	exit (0)
}
