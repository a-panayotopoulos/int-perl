#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

open my $fh, '<', 'words.txt' or die "Can't open file words.txt : $!";
my @words = <$fh>;
chomp(@words);

my @sorted_list =
    map $_->[0],
    sort { $a->[1] cmp $b->[1] }
    map [ $_->[0], $_->[1] =~ tr/a-z//cdr ],
    map [ $_, tr/A-Z/a-z/r ], @words;

say "Sorted Words :: ";
say for @sorted_list;

