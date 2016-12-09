#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use Regexp::Assemble;

use v5.12;

my $regex = Regexp::Assemble->new();

open( my $fh, "<", "test") or die "Dammit: $!";

while ( <$fh> ) {
	my $pattern = $_;
	chomp $pattern;
	$regex->add( "$pattern" );
}

$regex = $regex->re;

print $regex;

while ( <> ) {
	if ( $_ =~ $regex ){
		print $. . " " . $_;
	}
}
