#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my @names = qw(Gilligan Skipper Professor Ginger ginger-b Ginger-c Ginger'c Andrew Mary-Ann Marya Gillian);

print Dumper
map {
  $_->[0];
} sort {
    $a->[1] cmp $b->[1]
} map {
    my $tmp = $_;
    $tmp =~ tr/A-Z/a-z/;
    $tmp =~ tr/a-z//cd;
    [ $_, $tmp ]
} @names;