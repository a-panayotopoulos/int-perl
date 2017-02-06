#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my @words = qw { test 'Testing' ampersand TESTER tested };

my @sorted =
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map {
    my $transformed_string = $_;
    $transformed_string =~ tr/A-Z/a-z/; # force all lowercase
    $transformed_string =~ tr/a-z//cd; # strip all but a-z from the string
    [ $_, $transformed_string ];
  } @words;

print Dumper( @sorted );
