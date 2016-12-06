#!/usr/bin/perl

use strict;
use warnings;

use Benchmark qw( cmpthese );

cmpthese(1000, {
    'original' => sub { my @sorted = sort { -s $a <=> -s $b } glob 'C:/Windows/*'; },
    'schwartzian' => sub { my @sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [ $_, -s ] } glob 'C:/Windows/*'; },
});

