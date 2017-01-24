#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 3;

BEGIN {
    require_ok( 'Cow' ) || BAIL_OUT();
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# a cow says moooo
ok( defined &Cow::sound, 'Cow::sound is defined' );
is( Cow->sound(), "moooo", "A cow says moooo" );
