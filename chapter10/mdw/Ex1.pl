#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

chdir;  # the default is our home directory
my @sorted = sort { -s $a <=> -s $b } glob '*';

foreach (@sorted) {
  print "$_\n";
}

@sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [$_, -s $_] } glob '*';

print "NEXT\n";

foreach (@sorted) {
  print "$_\n";
}
