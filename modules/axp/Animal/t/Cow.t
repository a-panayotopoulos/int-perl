#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 7;
use Test::Fatal;

BEGIN {
    require_ok( 'Cow' ) || BAIL_OUT();
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Cow::sound, 'Cow::sound is defined' );
ok( defined &Cow::default_colour, 'Cow::default_colour is defined' );

# a cow instance
my $daisy = Cow->new( name => 'Daisy' );

# a cow says moooo
is( Cow->sound(), "moooo", "A cow says moooo" );
is( $daisy->sound(), "moooo", "Daisy says moooo" );

# Cows are white and black
is( Cow->default_colour(), "white and black", "Cow tend to be white and black" );
like( exception { $daisy->default_colour() }, qr/^Class method used as instance call/, 'default_colour is static' );
