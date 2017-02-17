#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 5;

BEGIN {
    foreach my $mod ( qw( Animal Cow Horse Mouse Sheep ) ) {
        use_ok( $mod ) || print "Bail out during $mod!\n";
    }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
