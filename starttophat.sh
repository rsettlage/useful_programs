#!/bin/bash

echo "Welcome to tophatsub!";

echo "Developed by K. Wyatt McMahon, Ph.D.
";

echo "Last modified January 22, 2013
";

echo "What is the pattern all read names have in common?
";

read PAT;


echo "Where is the gtf file? type n for none
";

read GTF;

echo "What is the bowtie index prefix?
";

read PREFIX;



if [ "$GTF" = "n" ]
then
    for i in $PAT; do OUT="${PWD}/${i}_out"; CMD="qsub /home/wmcmahon/PBS_scripts/tophat_PBS_copying_12_nogtf.sh -v OUT=$OUT,PREFIX=$PREFIX,LEFT=$PWD/$i"; $CMD; done;
else 
    for i in $PAT; do echo "i is $i"; OUT="${PWD}/${i}_out2"; echo "out is $OUT"; CMD="qsub /home/wmcmahon/PBS_scripts/tophat_PBS_copying_12_se2.sh -v OUT=$OUT,PREFIX=$PREFIX,GTF=$GTF,LEFT=$PWD/$i"; $CMD; done;
fi