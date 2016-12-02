#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

chdir; # the default is our home directory
my @sorted =
  map $_->[0],
  sort { $a->[1] <=> $b->[1] }
  map [ $_, -s $_ ],
  glob '*';

print Dumper( @sorted );
