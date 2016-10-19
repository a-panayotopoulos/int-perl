#!/usr/bin/perl

use strict;
use warnings;

my @results = grep is_small_file($_), @ARGV;

@results = map { "    " . $_ . "\n" } @results;

print @results;

sub is_small_file {
	my $imput = shift;
	if ( 1000 > (stat $imput)[7] ){
		return 1;
	} else {
		return 0;
	}
}
