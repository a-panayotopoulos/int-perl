#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use MyDate;

sub UNIVERSAL::debug {
  my ( $self, $message ) = @_;

  print time . "\n$message\n";
}

print "Debug: " . MyDate->debug( "The message I pass to it") . "\n";
print "Date: " . MyDate::date() . "\n";
print "Month: " . MyDate::month() . "\n";
print "Year: " . MyDate::year() . "\n";
print "StarDate: " . MyDate::StarDate() . "\n";
