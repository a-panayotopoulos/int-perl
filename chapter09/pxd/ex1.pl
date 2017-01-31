#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;
use feature "say";

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
			
say "Rigthmost match key is: $key";

sub rightmost {
 my( $string, $patterns ) = @_;
   
 my $rightmost = -1;
 my $found_key = undef;
 while( my( $i, $pattern ) = each %{$patterns} ) {
	my $position = $string =~ m/$pattern/ ? $-[0] : -1;
	if ($position > $rightmost) {
		$rightmost = $position;
		$found_key = $i;
	}
 }

 return $found_key; 		
}
