####
###tb2fasta_perl.sh tab_file fasta_file
###

`perl -e '$len=0; while(<>) {s/\r?\n//; @F=split /\t/, $_; print ">$F[0]"; if (length($F[1])) {print " $F[1]"} print "\n"; $s=$F[2]; $len+= length($s); $s=~s/.{60}(?=.)/$&\n/g; print "$s\n";} warn "\nConverted $. tab-delimited lines to FASTA format\nTotal sequence length: $len\n\n";' $1 >$2`
