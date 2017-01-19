#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 5;
use Test::Output;

BEGIN {
    require_ok( 'Mouse' ) || BAIL_OUT();
}

diag( "Testing Mouse $Mouse::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Mouse::sound, 'Mouse::sound is defined' );
ok( defined &Mouse::speak, 'Mouse::speak is defined' );

# Test mouse sound
is( Mouse->sound(), "squeak", "A Mouse says squeak" );

# Test mouse speaking
stdout_is { Mouse->speak() } "a Mouse goes squeak!\n[but you can barely hear it!]\n",
	"speak() is as expected";
