#!/usr/bin/perl

use strict;
use warnings;

my %gilligan_info = (
  name     => 'Gilligan',
  hat      => 'White',
  shirt    => 'Red',
  position => 'First Mate',
  location => 'The Island',
);
my %skipper_info = (
  name     => 'Skipper',
  hat      => 'Black',
  shirt    => 'Blue',
  position => 'Captain',
  location => 'The Island',
);
my %mrs_howell = (
  name     => 'Mrs. Howell',
  hat      => 'Black',
  shirt    => 'Blue',
  position => 'Captain',
  location => 'The Island',
);
my %mr_howell = (
  name     => 'Mr. Howell',
  hat      => 'Black',
  shirt    => 'Blue',
  position => 'Captain',
  location => 'The Island',
);
my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell, \%mrs_howell);

$_->{location} = "The Island Country Club" foreach grep { $_->{name} =~ /Howell/ } @crew;
printf( "%s at %s.\n", $_->{name}, $_->{location} ) foreach ( @crew );
