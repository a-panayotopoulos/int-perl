#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 8;

BEGIN {
	foreach my $class ( qw( LivingCreature Animal Cow Horse Sheep Mouse Person RaceHorse ) ) {
		use_ok( $class ) or print "Bail out! $class does not compile!\n";
	}
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
