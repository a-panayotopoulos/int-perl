#!/usr/bin/perl
use strict;
use warnings;

use Benchmark;

chdir; # the default is our home directory

my $original = sub {
  my @sorted = sort { -s $a <=> -s $b } glob '*';
};

my $transform = sub {
  my @sorted =
    map $_->[0],
    sort { $a->[1] <=> $b->[1] }
    map [ $_, -s $_ ],
    glob '*';
};

timethese( 1000000, { 'original' => $original, 'transform' => $transform } );
