#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 9;
use Test::Output;
use Test::Fatal;

BEGIN {
    require_ok( 'Person' ) || BAIL_OUT();
}

diag( "Testing Person $Person::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &Person::sound, 'Person::sound is defined' );
ok( defined &Person::speak, 'Person::speak is defined' );

# A person instance (N.B. instances of person are not yet supported)
my $axp = {};
bless $axp, 'Person';

# Test Person sound
is( Person->sound(), "humm-dee-humm", "A Person says humm-dee-humm" );
is( $axp->sound(), "humm-dee-humm", "axp says humm-dee-humm" );

# Test Person speaking
stdout_is { Person->speak() } "a Person goes humm-dee-humm!\n", "speak() without params";
stdout_is { Person->speak( 'meh' ) } "a Person says 'meh'\n", "speak() with params";
stdout_is { Person->speak( '' ) } "a Person goes humm-dee-humm!\n", "speak() with falsey string";
like( exception { $axp->speak() }, qr/^Static method used as instance call/, 'speak is static' );
