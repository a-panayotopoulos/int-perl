#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 7;
use Test::Fatal;

BEGIN {
    require_ok( 'Horse' ) || BAIL_OUT();
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Horse::sound, 'Horse::sound is defined' );
ok( defined &Horse::default_colour, 'Horse::default_colour is defined' );

# a horse instance
my $ed = Horse->named( 'Mr. Ed' );

# a Horse says neigh
is( Horse->sound(), "neigh", "A Horse says neigh" );
is( $ed->sound(), "neigh", "Mr. Ed says neigh" );

# Horses are brown, most commonly
is( Horse->default_colour(), "brown", "Horse tend to be brown" );
like( exception { $ed->default_colour() }, qr/^Static method used as instance call/, 'default_colour is static' );
