#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use File::Slurp;

my %total_bytes;
my $storage = "totals.txt";

if ( -s $storage ) {
	%total_bytes = %{ from_json( read_file( $storage ) )};
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

write_file( $storage, to_json( \%total_bytes, { pretty => 1 } ) );

