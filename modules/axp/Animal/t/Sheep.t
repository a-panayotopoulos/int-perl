#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 3;

BEGIN {
    require_ok( 'Sheep' ) || BAIL_OUT();
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# a Sheep says baaaah
ok( defined &Sheep::sound, 'Sheep::sound is defined' );
is( Sheep->sound(), "baaaah", "A Sheep says baaaah" );
