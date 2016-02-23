#!/usr/bin/env gawk
###needs file 1 and file 2 as input, file 1 is actual gtf file, file 2 is sorted transcript list
###awk '{ if($3=="transcript"){print $0} }' pasa.gtf | sort -k 3,3r -k 1,1 -k 4,4n > pasa_transcript_list.txt
###should this worry about the strand flag???  for unstranded data, I think no???

####change fields to reflect the selection feilds as appropriate
BEGIN { 
	file1 = ARGV[1]

	first=""
	last_E=""

	###read in transcript list and create a correction table
	while (getline < file1) {
		if(first==""){
			first=1
			last_E=$5
		}else{
			if(last_E>=$4){
				$4=last_E+2
				$0=$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9" "$10" "$11" "$12" "$13" "$14
			}
			last_E=$5
		}
		print $0
	}
	exit (0)
}
###

