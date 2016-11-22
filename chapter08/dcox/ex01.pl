#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;
use Time::Local;

print "File/Scalar/Both?\n";

chomp( my $input = <STDIN> );

my $fh;
my $scalar;
my $filename = "ex01.pl.out";

if ( $input =~ /File/i ) {
  open $fh, '>', $filename;
}
elsif ( $input =~ /Scalar/i ) {
  open $fh, '>', \$scalar;
}
elsif ( $input =~ /Both/i ) {
  open my $file_fh, '>', $filename;
  open my $scalar_fh, '>', \$scalar;
  $fh = IO::Tee->new( $file_fh, $scalar_fh );
}
else {
  die "Huh?";
}

my @day_of_week = qw [ Sunday Monday Tuesday Wednesday Thursday Friday Saturday ];

my ( $sec, $min, $hour, $day, $mon, $yr, $dow ) = localtime;

print $fh "$day/$mon $day_of_week[$dow]\n";

if ( $input !~ /File/i ) {
  print $scalar;
}

