#!/usr/bin/perl -w
use strict;
use warnings;

# bam/sam: 1 based
# bed: 0 based and [start, end)

if(@ARGV !=3) {
    print STDERR "Usage: sam2bed_PE.pl MappinQuality_cutoff sam_file bed_file\n";
    exit(0);
}
my ($cutoff, $inf, $outf)=@ARGV;
open(IN, $inf) or die "Cannot open $inf\n";
open(OUT, ">$outf") or die "Cannot open $outf\n";
while(<IN>){
	next if $_=~/^\@/;
	my @info=split(/\t/,$_);
	if(defined($info[8]) && $info[8]>0 && $info[4]>=$cutoff){
		if($info[1] & 64){
			# read 1 (read1 is at the left end)
			print OUT "$info[2]\t".($info[3]-1)."\t".($info[3]+$info[8]-1)."\t.\t.\t+\n";
		}elsif($info[1] & 128){
			# read 2 (read 1 is at the right end)
			print OUT "$info[2]\t".($info[3]-1)."\t".($info[3]+$info[8]-1)."\t.\t.\t-\n";
		}else{
			print STDERR "Wrong FLAGS for $info[0]: $info[1]\n"; exit;
		}
	}
}
close IN;
close OUT;
