#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 3;

BEGIN {
    require_ok( 'Horse' ) || BAIL_OUT();
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# a Horse says neigh
ok( defined &Horse::sound, 'Horse::sound is defined' );
is( Horse->sound(), "neigh", "A Horse says neigh" );
