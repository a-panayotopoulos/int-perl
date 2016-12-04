#!/usr/bin/perl

use strict;
use warnings;
use feature "say" ;

my $dir = $ARGV[0] // '/home/pxd';
chdir $dir;

# Simple way
# my @sorted_list = sort { -s $a <=> -s $b } glob '*';
# say for @sorted;

# Using Schwartzian Transform
my @sorted_list = map $_->[0], sort { $a->[1] <=> $b->[1] } map [ $_, -s $_ ], glob '*';

say "List of files in $dir sorted by file size :: ";
say for @sorted_list;
