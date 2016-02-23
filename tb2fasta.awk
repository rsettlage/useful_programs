#!/bin/bash

## call with
##bash /groups/DAC/useful_programs/tb2fasta.awk M_all050 >M_all050.fasta

awk '{
seq = $2
l = length(seq)
i = 1
printf ">%s\n", $1
while (i <= l){
  printf "%s\n", substr(seq,i,80)
  i=i+80
}
}' "$@"

