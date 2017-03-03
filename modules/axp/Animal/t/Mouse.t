#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 10;
use Test::Output;
use Test::Fatal;

BEGIN {
    require_ok( 'Mouse' ) || BAIL_OUT();
}

diag( "Testing Mouse $Mouse::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Mouse::sound, 'Mouse::sound is defined' );
ok( defined &Mouse::speak, 'Mouse::speak is defined' );
ok( defined &Mouse::default_colour, 'Mouse::default_colour is defined' );

# a mouse instance
my $mickey = Mouse->new( name => 'Mickey' );

# Test mouse sound
is( Mouse->sound(), "squeak", "A Mouse says squeak" );
is( $mickey->sound(), "squeak", "Mickey says squeak" );

# Test mouse speaking
stdout_is { Mouse->speak() } "a Mouse goes squeak!\n[but you can barely hear it!]\n",
	"speak() is as expected for mouse class";
stdout_is { $mickey->speak() } "Mickey goes squeak!\n[but you can barely hear it!]\n",
	"speak() is as expected for mouse instances";

# Mice are grey
is( Mouse->default_colour(), "grey", "Mice tend to be white and black" );
like( exception { $mickey->default_colour() }, qr/^Class method used as instance call/, 'default_colour is static' );
