#!/usr/bin/perl

use strict;
use warnings;

my %total_bytes;
my %total_from_source;

while ( <> ) {
	next if /^#/; #I can't actually find any comments in the file?
	my ( $line_source, $line_destination, $bytes ) = split;
	$total_bytes{$line_source}{$line_destination} += $bytes;
	$total_from_source{$line_source} += $bytes;
}

foreach my $source ( sort { $total_from_source{$b} <=> $total_from_source{$a} } keys %total_from_source ){
	foreach my $destination ( sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %total_bytes ) {
		printf "%s => %s : %d\n", $source, $destination, $total_bytes{$source}{$destination};
	}
}

	

