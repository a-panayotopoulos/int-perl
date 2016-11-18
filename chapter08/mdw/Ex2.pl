#!/usr/bin/perl

use strict;
use warnings;

sub new_fh {
	my ( $user ) = @_;
	$user .= ".info";
	open my $user_fh, '>>', $user or die "could not open file.txt: $!";
	return $user_fh
}

my %handle_selector = ( );

while ( <> ) {
my ( $user, $line ) = split( /:/, $_ );

unless ( $handle_selector{$user} ) {
	$handle_selector{$user} = new_fh( $user );
}

print {$handle_selector{$user}} $line;

}
