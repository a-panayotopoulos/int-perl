#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 9;
use Test::Output;
use Test::Fatal;

BEGIN {
    require_ok( 'LivingCreature' ) || BAIL_OUT();
}

diag( "Testing LivingCreature $LivingCreature::VERSION, Perl $], $^X" );

# subroutines are defined in LivingCreature.pm
ok( defined &LivingCreature::new, 'LivingCreature::new is defined' );
ok( defined &LivingCreature::speak, 'LivingCreature::speak is defined' );
ok( defined &LivingCreature::sound, 'LivingCreature::sound is defined' );

# but by default they don't work, because sound is not defined
my $expected_error = qr/^You have to define sound\(\) in a subclass/;
like( exception { LivingCreature->sound() }, $expected_error, 'sound() dies with expected message' );
like( exception { LivingCreature->speak() }, $expected_error, 'speak() dies with expected message' );

# if we define a subclass, it works
{
	package MahnaMahna;
	use parent qw( LivingCreature );
	sub sound {
		return 'Mahna Mahna';
	}
}

stdout_is { MahnaMahna->speak() } "a MahnaMahna goes Mahna Mahna!\n", "speak() is as expected";

# A living creature instance
my $deedoodoo = MahnaMahna->new();
like( exception { $deedoodoo->speak }, qr/^Class method used as instance call/, 'speak called on an instance' );
like( exception { $deedoodoo->new }, qr/^Static constructor used as instance call/, 'try to call new() on an instance' );