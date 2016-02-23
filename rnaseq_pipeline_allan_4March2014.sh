# read default configuration file
source /groups/DAC/useful_programs/16S_pipeline.config

# read local config file, if any
source local_16S_pipeline.config

perl /groups/DAC/useful_perl/usearch.utils/derepFasta.pl 1>&2 
if [[ ! -f derep.fa ]]; then echo "cannot find derep.fa"; exit; fi

#$usearch should be the binary
if [[ ! -x $usearch ]]; then echo "cannot find $usearch"; exit; fi

$usearch -cluster_otus derep.fa -otus 16S_otu_repseq.fa -otuid $otu_ident

$usearch -search_global derep.fa -db 16S_otu_repseq.fa -id 0.97 -strand plus -uc derep_readmap.uc

perl /groups/DAC/useful_perl/usearch.utils/pullNoHitSequences.pl derep_readmap.uc derep.fa > notu.fa

cat 16S_otyu_repseq.fa notu.fa > otu_and_notu_orig.fa

perl /groups/DAC/useful_perl/usearch.utils/relabelOtus.pl derep_and_notu.fa > otu_and_notu.fa

perl /groups/DAC/useful_perl/usearch.utils/createUsearchGlobalJobs.pl 


