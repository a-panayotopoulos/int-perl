#!/usr/bin/perl

use strict;
use warnings;

my @files = 
    map $_->{name},
    sort { $b->{size} <=> $a->{size} }
    map { name => $_, size => -s $_ },
    glob '*';

print join "\n", @files, "\n";
