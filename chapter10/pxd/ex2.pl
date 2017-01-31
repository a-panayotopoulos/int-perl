#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(cmpthese);

chdir '/home/pxd';
my @all_files = glob '*';   

# Simple method
my $simple = sub {
    my @sorted = sort { -s $a <=> -s $b } @all_files;
};

# Using Schwartzian Transform
my $schwartzian_transform = sub {
    my @st_sorted = 
        map $_->[0],
        sort { $a->[1] <=> $b->[1] }
        map [ $_, -s $_ ],
        @all_files;
};

my $delta = -50;    

cmpthese($delta, {
    'Simple method' => $simple,
    'Schwartzian Transform' => $schwartzian_transform,
});



==========================================================================


                        Rate         Simple method Schwartzian Transform
Simple method         1973/s                    --                  -51%
Schwartzian Transform 4009/s                  103%                    --



==========================================================================