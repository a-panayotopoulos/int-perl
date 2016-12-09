#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my @patterns = ();

open( my $fh, "<", "test") or die "Dammit: $!";

while ( <$fh> ) {
	my $patten = $_;
	chomp $patten;
	$patten = qr/$patten/;
	push @patterns, $patten;
}

while ( <> ) {
	if ( $_ ~~ @patterns ){
		print $. . " " . $_;
	}
}
