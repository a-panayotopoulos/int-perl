#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 6;

BEGIN {
	foreach my $class qw( LivingCreature Animal Cow Horse Sheep Mouse ) {
		use_ok( $class ) or print "Bail out! $class does not compile!\n";
	}
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
