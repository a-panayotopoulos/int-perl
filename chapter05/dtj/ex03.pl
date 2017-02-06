#!/usr/bin/perl

use strict;
use warnings;

my %total_bytes;

while ( <> ) {
	next if /^#/; 
	my ( $line_source, $line_destination, $bytes ) = split;
	$total_bytes{$line_source}{$line_destination} += $bytes;
}

foreach my $source ( sort keys %total_bytes ){
	print "$source\n";
	foreach my $destination ( sort keys %total_bytes ) {
		printf "\t%s %d\n", $destination, $total_bytes{$source}{$destination};
	}
}

	

