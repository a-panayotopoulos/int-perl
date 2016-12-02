#!/usr/bin/perl

use strict;
use warnings;

$| = 1;

my @sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [ $_, -s ] } glob 'C:/Windows/*';
print join( "\n", @sorted ), "\n";