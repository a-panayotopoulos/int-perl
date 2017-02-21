#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 23;
use Test::Fatal;

BEGIN {
    use_ok( 'NatLang' ) || print "Bail out!\n";
}

# subroutines are defined
ok( defined &NatLang::number_to_day_name, 'NatLang::number_to_day_name is defined' );
ok( defined &NatLang::number_to_month_name, 'NatLang::number_to_month_name is defined' );

# Test first and last days of week, month
is( NatLang::number_to_day_name(0), 'ark', 'First day' );
is( NatLang::number_to_month_name(0), 'diz', 'First month' );
is( NatLang::number_to_day_name(6), 'kir', 'Last day' );
is( NatLang::number_to_month_name(11), 'dep', 'Last month' );

# Test that you can pass stringified numbers
is( NatLang::number_to_day_name('3'), 'sen', 'Stringified day index' );
is( NatLang::number_to_month_name('3'), 'rod', 'Stringified month index' );

# Test that you can pass negative indices
is( NatLang::number_to_day_name(-7), 'ark', 'First day, neg idx' );
is( NatLang::number_to_month_name(-12), 'diz', 'First month, neg idx' );
is( NatLang::number_to_day_name(-1), 'kir', 'Last day, neg idx' );
is( NatLang::number_to_month_name(-1), 'dep', 'Last month, neg idx' );

# Test out of range
like( exception { NatLang::number_to_day_name(-8) }, qr/^Day number -8 out of range 0-6/, 'Day too small' );
like( exception { NatLang::number_to_month_name(-13) }, qr/^Month number -13 out of range 0-11/, 'Month too small' );
like( exception { NatLang::number_to_day_name(7) }, qr/^Day number 7 out of range 0-6/, 'Day too large' );
like( exception { NatLang::number_to_month_name(12) }, qr/^Month number 12 out of range 0-11/, 'Month too large' );

# Test nonsense
like( exception { NatLang::number_to_day_name() }, qr/^No day number provided/, 'Day undef' );
like( exception { NatLang::number_to_month_name() }, qr/^No month number provided/, 'Month undef' );
like( exception { NatLang::number_to_day_name('b4') }, qr/^Argument 'b4' is not numeric/, 'Day non-numeric' );
like( exception { NatLang::number_to_month_name('b4') }, qr/^Argument 'b4' is not numeric/, 'Month non-numeric' );
like( exception { NatLang::number_to_day_name('1.8') }, qr/^Argument '1.8' is not numeric/, 'Day non-integer' );
like( exception { NatLang::number_to_month_name('1.8') }, qr/^Argument '1.8' is not numeric/, 'Month non-integer' );
