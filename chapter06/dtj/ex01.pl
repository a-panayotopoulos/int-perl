#!/usr/bin/perl

use strict;
use warnings;
use Storable;

my %total_bytes;
my $storage = "totals.txt";

if ( -s $storage ) {
	%total_bytes = %{ retrieve( $storage ) };
}	

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

store( \%total_bytes, $storage );

	

