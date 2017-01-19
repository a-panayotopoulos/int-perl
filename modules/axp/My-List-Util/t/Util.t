#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 17;
use Test::Warn;

BEGIN {
    require_ok( 'My::List::Util' ) || BAIL_OUT();
}

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );

# Check that subroutines are defined
ok( defined &My::List::Util::sum, 'Util::sum is defined' );
ok( defined &My::List::Util::shuffle, 'Util::shuffle is defined' );

# Check that sum works as expected
is( My::List::Util::sum( 1, 2, 3 ), 6, 'Sum positive integers' );
is( My::List::Util::sum( -1, 4, -7 ), -4, 'Sum positive and negative integers' );
is( My::List::Util::sum( 0.3, 5, -1.6 ), 3.7, 'Sum decimals' );
is( My::List::Util::sum( '6', '7' ), 13, 'Numbers as strings' );
is( My::List::Util::sum( 1 ), 1, 'Single item list' );
is( My::List::Util::sum(), 0, 'Zero item list' );
is( no_warnings( \&My::List::Util::sum, '3', '6ix', 'one' ), 9, 'Ignore characters' );

warning_like { My::List::Util::sum( 'y' ) } qr/^Argument "y" isn't numeric in addition/, "Non-numeric warning";


# Check that shuffle works as expected
# NOTE: chances of a 12-item list being in the same order after shuffling = 1/12!
# So, one in 479,001,600. I think we can be fairly confident that the 'different' test will pass.
my @in = qw( a b c d e f 6 5 4 3 2 1 );
my @out = My::List::Util::shuffle( @in );
	
is( scalar @out, scalar @in, 'Length is unchanged' );

my $diff = 0;

for ( my $i = 0; $i < @out; $i++ ) {
	$diff |= ( $in[$i] ne $out[$i] );
}

is( $diff, 1, 'List is different after shuffle' );
is_deeply( [ sort @out ], [ sort @in ], 'Values are the same' );

is_deeply( [ My::List::Util::shuffle( 'yo' ) ], [ 'yo' ], 'Single item list' );
is_deeply( [ My::List::Util::shuffle() ], [], 'Zero item list' );
is_deeply( [ My::List::Util::shuffle( 'yo', 'yo' ) ], [ 'yo', 'yo' ], 'List with duplicates' );

sub no_warnings {
	my $f = shift;
	local $SIG{__WARN__} = sub {};
	return $f->( @_ );
}