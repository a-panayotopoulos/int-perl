#!/usr/bin/perl

use strict;
use warnings;
use Try::Tiny;

my $hardcodedlocation = "/home/mdw/int-perl/chapter03/mdw";

opendir(DIR, $hardcodedlocation) or die $!;

my @files = readdir(DIR);

print "Enter a pattern:";

while ( my $line = <> ) {
	chomp $line;
	if ( $line eq "" ) {
		last;
	}
	foreach my $file ( @files ) {
		my $end = 0;
		my $match = try { 
			$file =~ m/$line/ 
		} catch { 
			print "Invalid Regex";
			$end = 1;
		};
		if ( $end ) {
			last;
		}
		if ( $match ) {
			print $file;
		}
	}
	print "\nAnother?";
}
