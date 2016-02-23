#!/bin/bash
date
ADAPTER_FILE="/groups/DAC/vector_contaminant_fasta/Illumina_adapters.txt"
module load bio/ea-utils

for f in *_R1_*fastq.gz *_R1_*fastq.gz
do
	echo file = $f
	#ls -l $f
	o1="${f%.fastq.gz}_fastqmcf.fastq"
	f2=`perl -e '$f=shift; print $f if $f=~s/_R1_/_R2_/' $f`
	echo file2 = $f2
	if [ -f $f2 ]; then
		#ls -l $f2
		o2="${f2%.fastq.gz}_fastqmcf.fastq"
		echo fastq-mcf $ADAPTER_FILE  $f $f2 -o $o1 -o $o2
		echo "Trimmed output to $o1 and $o2"
	else
		echo "Could not find mate file $f2"
	fi
done

date
