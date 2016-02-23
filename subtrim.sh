#!/bin/bash

echo $1;
qsub /home/wmcmahon/PBS_scripts/trim_fastq.sh -v Type=s,FILE1=$1;
exit;