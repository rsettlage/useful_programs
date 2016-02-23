#!/usr/bin/env gawk
###read through ordered blast alignment and created 'gene goalposts'
BEGIN {
	file1 = ARGV[1]

	getline < file1
	chromosome = $1
	currentstart = $2
	currentend = $3

	while (getline < file1) {
		if($1 == chromosome){
			if($2<currentend){
				if($3>currentend){
					currentend=$3
				}
			}else{
				print "cdbyank /groups/DAC/bird_genomes/UMD_51/genome.scf.fasta.cidx -R -a '"chromosome" "currentstart" "currentend"'"
				currentstart=$2
				currentend=$3
			}

		}else{
			print "cdbyank /groups/DAC/bird_genomes/UMD_51/genome.scf.fasta.cidx -R -a '"chromosome" "currentstart" "currentend"'"
			chromosome = $1
			currentstart = $2
			currentend = $3
		}
	}


	exit (0)
}