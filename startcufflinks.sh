#!/bin/bash


echo "What is the GTF? n for none
";

read GTF;

#echo GTF is ${GTF};

echo "Where are the bam files?";

read PAT;

echo "What suffix for the outfile?";

read OUTS;
if [ ${GTF} = "n" ]
then
for i in $PAT; do BAM=$PWD/$i; OUT=$PWD/${i}_${OUTS}; CMD="qsub /home/wmcmahon/PBS_scripts/cufflinks_PBS2_nogtf.sh -v OUT=$OUT,BAM=$BAM";${CMD}; done;
else
for i in $PAT; do BAM=$PWD/$i; OUT=$PWD/${i}_${OUTS}; CMD="qsub /home/wmcmahon/PBS_scripts/cufflinks_PBS2.sh -v OUT=$OUT,GTF=${GTF},BAM=$BAM";${CMD}; done;
fi

