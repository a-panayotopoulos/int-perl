#!/usr/bin/perl

use strict;
use warnings;

use MyDate;

MyDate->import;
my $date = MyDate->new();

print "The date is " . $date->date . "-" . $date->month . "-" . $date->year . "\n";

sub UNIVERSAL::debug {
  my $self = shift;
  my $debug_line = join ":", @_;

  print localtime . ":" . $debug_line . "\n";
}

$date->debug( "Fin" );


