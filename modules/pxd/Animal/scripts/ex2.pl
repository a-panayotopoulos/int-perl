#!/usr/bin/perl

use strict;
use warnings;

use Cow;
use Sheep;
use Horse;
use Mouse;

my @animals = ();

while(1) {
  print "Enter the animal you wish to speak to ('q' to exit): ";
  chomp(my $animal = <STDIN>);
  if( $animal =~ /^(Cow|Horse|Sheep|Mouse)$/ ) {
    push @animals, $animal;
  }
  elsif ( $animal =~ /^(q|quit)$/ ) { last; }
  else { print "The animal is currently not present. Choose among (Cow|Horse|Sheep|Mouse)\n"; }
}
foreach my $animal (@animals) {
  $animal->speak;
}
