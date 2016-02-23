#!/bin/bash
##usage bash /groups/DAC/useful_programs/mark_realign_recal.sh bam_file.bam 
date
##needs the following modules
##module load bio/picard/1.92
##module load bio/gatk/3.2-2

bam_file=$1
genome_file="/groups/DAC/blastdbs/dog/Canis_familiaris.CanFam3.1.74.dna.toplevel.fa"

echo bamfile = $bam_file
`java -Xmx4g -jar /apps/packages/bio/picard/1.92/bin/MarkDuplicates.jar INPUT=$bam_file OUTPUT=$bam_file.marked.bam METRICS_FILE=metrics CREATE_INDEX=true VALIDATION_STRINGENCY=LENIENT`

exit
end
date
java -Xmx4g -jar /apps/packages/bio/GenomeAnalysisTK/3.2-2/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-R $genome_file \
-o $bam_file.bam.list \
-I $bam_file.marked.bam



java -Xmx4g -Djava.io.tmpdir=./tmp \
-jar /apps/packages/bio/GenomeAnalysisTK/3.2-2/GenomeAnalysisTK.jar \
-I $bam_file.marked.bam \
-R $genome_file \
-T IndelRealigner \
-targetIntervals $bam_file.bam.list \
-o $bam_file.marked.realigned.bam


java -Xmx4g -jar /apps/packages/bio/GenomeAnalysisTK/3.2-2/GenomeAnalysisTK.jar \
-l INFO \
-R $genome_file \
--DBSNP dbsnp132.txt \
-I $bam_file.marked.realigned.fixed.bam \
-T CountCovariates \
-cov ReadGroupCovariate \
-cov QualityScoreCovariate \
-cov CycleCovariate \
-cov DinucCovariate \
-recalFile $bam_file.recal_data.csv
