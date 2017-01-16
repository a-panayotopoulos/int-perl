#!/usr/bin/perl
use warnings;
use strict;

use lib './lib'; 
use Cow;
use Horse;
use Sheep;
use Person;
use Mouse;
use Try::Tiny;

my @communicator = qw(Person Cow Fred);

foreach my $being (@communicator) {
  try {
  $being->speak("Hello World!\n");
  } catch {
  print "the $being is unknown\n";
  }
}
