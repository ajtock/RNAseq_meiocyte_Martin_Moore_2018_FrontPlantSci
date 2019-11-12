#!/bin/bash

# Run fastqc on each fastq.gz file in directory
# and move output files to fastqc directory

[ -d fastqc ] || mkdir fastqc
[ -d fastqc/raw ] || mkdir fastqc/raw
for f in *.fastq.gz
do
( echo "Processing $f"
  fastqc $f --contaminants ../contaminants/contaminants_list_fastqc.txt --adapters ../contaminants/contaminants_list_fastqc.txt 
  echo "$f processing complete" ) &
done
wait
mv *_fastqc.* fastqc/raw

