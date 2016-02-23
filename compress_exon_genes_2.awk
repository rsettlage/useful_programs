#!/usr/bin/env gawk
###needs file 1 and file 2 as input, file 1 is actual gtf file, file 2 is sorted transcript list
###awk '{ if($3=="transcript"){print $0} }' pasa.gtf | sort -k 3,3r -k 1,1 -k 4,4n > pasa_transcript_list.txt
###should this worry about the strand flag???  for unstranded data, I think no???

####change fields to reflect the selection feilds as appropriate
BEGIN {
	file1 = ARGV[1]
	file2 = ARGV[2]

	first=""
	last_chr=""
	last_S=""
	last_E=""
	last_clsr=""

	###read in transcript list and create a correction table
	while (getline < file2) {
		if(first==""){
			first=1
			last_chr=$1
			last_S=$4
			last_E=$5
			last_clsr=$10
			y[$10]=$10
			z[$12]=$10
		}else{
			if($3=="transcript"){
				if($1==last_chr && ((last_E>=$5 && $5>=last_S) || (last_E>=$4 && $4>=last_S) || (last_S>$4 && $5>last_E))){
					y[$10]=last_clsr
					z[$12]=last_clsr
					if(last_E<$5){
						last_E=$5
					}
					if(last_S>$4){
						last_S=$1
					}
				}else{
						y[$10]=$10
						last_S=$4
						last_E=$5
						last_clsr=$10
						last_chr=$1
				}
			}
		}
	}

	while (getline < file1) {
		$10=y[$10]
		print $0
	}

	exit (0)
}
###


#END{
#for(j in y) if(j!=y[j]){print j"\t"y[j]}
#}