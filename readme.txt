# N6amt1 ChIP-Seq data analysis: "Custom PERL script was then applied to parse the number of fragments (hereafter referred as counts) that cover the peak summit in each sample."

# Usage:
MACS_21ReadCount_BinarySearch_n6amt1.pl F mapping_stats.xls summits_position.xls bed_folder output1(raw counts table) output2(normalized counts table) output_prefix


Each parameter/file required by "MACS_21ReadCount_BinarySearch_n6amt1.pl" is briefly described below:
1) F/T, "F" means don't print the header line, and "T" means print the header line;
2) "mapping_stats.xls" is the mapping summary file. Note the 5th column of "mapping_stats.xls" is used for normalization. Please make sure that you prepare a similar mapping summary file if you want to use this script for your own project;
3) "summits_position.xls" lists peak summit positions. Only two columns are required in this file. The 1st column lists chromosomes, and the 2nd column lists positions. A "summits_position_snippet.xls" is also uploaded for your reference;
4) "bed_folder" is the folder that contains bed files from the alignment; One may use the samtools and "sam2bed_PE.pl" (also uploaded to https://github.com/Qiongyi/2018_DPNI-Seq_study) to generate bed files from position-sorted BAM files. For example: 
samtools view S2.sort.bam | sam2bed_PE.pl 20 - S2.bed
5) An output file contains raw counts;
6) An output file contains normalized counts (the number of mapped reads used for normalization is listed in "mapping_stats.xls");
7) The prefix of output files.

