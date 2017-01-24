#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 7;
use Test::Output;

BEGIN {
    require_ok( 'Person' ) || BAIL_OUT();
}

diag( "Testing Person $Person::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Person::sound, 'Person::sound is defined' );
ok( defined &Person::speak, 'Person::speak is defined' );

# Test Person sound
is( Person->sound(), "humm-dee-humm", "A Person says humm-dee-humm" );

# Test Person speaking
stdout_is { Person->speak() } "a Person goes humm-dee-humm!\n", "speak() without params";
stdout_is { Person->speak( 'meh' ) } "a Person says 'meh'\n", "speak() with params";
stdout_is { Person->speak( '' ) } "a Person goes humm-dee-humm!\n", "speak() with falsey string";
