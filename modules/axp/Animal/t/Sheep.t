#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 7;
use Test::Fatal;

BEGIN {
    require_ok( 'Sheep' ) || BAIL_OUT();
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Sheep::sound, 'Sheep::sound is defined' );
ok( defined &Sheep::default_colour, 'Sheep::default_colour is defined' );

# a sheep instance
my $dolly = Sheep->new( name => 'Dolly' );

# a Sheep says baaaah
is( Sheep->sound(), "baaaah", "A Sheep says baaaah" );
is( $dolly->sound(), "baaaah", "Dolly says baaaah" );

# Sheep are white
is( Sheep->default_colour(), "white", "Sheep tend to be white" );
like( exception { $dolly->default_colour() }, qr/^Class method used as instance call/, 'default_colour is static' );
