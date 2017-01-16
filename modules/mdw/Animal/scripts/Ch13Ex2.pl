#!/usr/bin/perl
use warnings;
use strict;

use lib './lib'; 
use Cow;
use Horse;
use Sheep;
use Mouse;
use Try::Tiny;

print "Enter list of Animals:";
my @pasture = qw();

while ( <> ) {
 my $object =  $_;
 chomp $object;
 push @pasture, $object;  
}

foreach my $beast (@pasture) {
  try {
  $beast->speak;
  } catch {
  print "the $beast is unknown\n";
  }
}
