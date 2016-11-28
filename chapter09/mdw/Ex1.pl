#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

my $key = rightmost( 
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
);	
	
sub rightmost {
  my( $string, $patterns ) = @_;
  
  my $lastpattern;
  my $rightmost = -1;
  foreach $key ( keys %{$patterns} ) {
	my $pattern = $patterns{$key};
	my $position = $string =~ m/$pattern/ ? $-[0] : -1;
	if ( $position > $rightmost ){
		$rightmost = $position;
		$lastpattern = $key;
	}
  }

  return $lastpattern; 		
}

print $key . "\n";
