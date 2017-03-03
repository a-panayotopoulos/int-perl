#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 17;
use Test::Output;
use Test::Fatal;

BEGIN {
    require_ok( 'Animal' ) || BAIL_OUT();
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Animal::name, 'Animal::name is defined' );
ok( defined &Animal::colour, 'Animal::colour is defined' );
ok( defined &Animal::default_colour, 'Animal::default_colour is defined' );

# define a subclass which implements necessary subroutines
{
	package Muppet;
	use parent qw( Animal );
	sub default_colour {
		return "pink";
	}
	sub sound {
		return 'meep';
	}
}

# Test construction
my $muppet = Muppet->new( name => 'Beaker' );
is( ref( $muppet ), 'Muppet', "Created a Muppet instance" );
like( exception { Muppet->new }, qr/^Attribute \(name\) is required/, 'new() without params' );

# Test 'name' (an instance getter/setter)
like( exception { Muppet->name }, qr/^Instance variable needed/, 'try to get a name statically' );
like( exception { Muppet->name( 'Gonzo' ) }, qr/^Instance variable needed/, 'try to set a name statically' );
is( $muppet->name, 'Beaker', 'Name getter' );
$muppet->name( 'Fozzy' );
is( $muppet->name, 'Fozzy', 'Name has been set' );

# Test 'colour' (an instance getter/setter, or a class getter)
is( Muppet->colour, 'pink', "Get colour statically" );
like( exception { Muppet->colour( 'Blue' ) }, qr/^Instance variable needed/, 'try to set a colour statically' );
is( $muppet->colour, 'pink', 'Colour getter' );
$muppet->colour( 'brown' );
is( $muppet->colour, 'brown', 'Colour has been set' );

# Test default_colour
like( exception { Animal->default_colour }, qr/^You have to define default_colour\(\) in a subclass/,
	'Default colour is undefined for generic animal' );

# Test 'speak'
stdout_is { Muppet->speak() } "a Muppet goes meep!\n", "speak() is as expected for class call";
stdout_is { $muppet->speak() } "Fozzy goes meep!\n", "speak() is as expected for instance call";
