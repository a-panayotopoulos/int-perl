#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = ( Gilligan => qr/(?:Wiley )?Gilligan/,
                 'Mary-Ann' => qr/Mary-Ann/,
                 Ginger => qr/Ginger/,
                 Professor => qr/(?:The )?Professor/,
                 Skipper => qr/Skipper/,
                 'A Howell' => qr/Mrs?. Howell/,
                 );

my $position = rightmost( 'There is Mrs. Howell, Ginger, and Gilligan', \%patterns );

print "Rightmost match was $position\n";

sub rightmost {
  my ( $string, $patterns ) = @_;

  my $rightmost = -1;
  my $return_key = undef;
  while ( my ( $key, $value ) = each %$patterns ) {
    my $position = $string =~ m/$value/ ? $-[0] : -1;
    if ( $position > $rightmost ) {
      $rightmost = $position;
      $return_key = $key;
    }
  }

  return $return_key;
}
