#!/usr/bin/perl

use strict;
use warnings;
use List::AllUtils qw( pairmap reduce );

my %patterns = (
  Gilligan   => qr/(?:Willie )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?\. Howell/,
);

my $match = rightmost(
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
);

if ( $match ) {
    print "Rightmost match [$match->{key}] at position $match->{start}\n";
}
else {
    print "No matches\n";
}

sub rightmost {
  my( $string, $patterns ) = @_;

  # Doesn't find all if more than one
  my $rightmost_match = reduce { ( !defined $a || $b->{start} > $a->{start} ) ? $b : $a } undef, grep { $_->{start} > -1 } pairmap { { key => $a, start => ($string =~ $b ? $-[0] : -1) } } %$patterns;

  return $rightmost_match;
}