#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 23;
use Test::Fatal;

BEGIN {
    require_ok( 'RaceHorse' ) || BAIL_OUT();
}

diag( "Testing RaceHorse $RaceHorse::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &RaceHorse::named, 'RaceHorse::named is defined' );
ok( defined &RaceHorse::won, 'RaceHorse::won is defined' );

# test 'named'
my $gg = RaceHorse->named( 'Nonsequituriat' );
ok( $gg->DOES( "RaceHorse" ), 'RaceHorse object created' );
is( $gg->{wins}, 0, 'Wins initialised to zero' );
is( $gg->{places}, 0, 'Places initialised to zero' );
is( $gg->{shows}, 0, 'Shows initialised to zero' );
is( $gg->{losses}, 0, 'Losses initialised to zero' );
like( exception { $gg->named( 'Mr. Ed' ) }, qr/^Static constructor used as instance call/, 'named is static' );

# test 'won'
ok( $gg->won, 'Horse won a race' );
is( $gg->{wins}, 1, 'Wins incremented' );
like( exception { RaceHorse->won }, qr/^Instance variable needed/, "won can't be called statically" );

# test 'placed'
ok( $gg->placed, 'Horse placed in a race' );
is( $gg->{places}, 1, 'Places incremented' );
like( exception { RaceHorse->placed }, qr/^Instance variable needed/, "placed can't be called statically" );

# test 'showed '
ok( $gg->showed, 'Horse showed in a race' );
is( $gg->{shows}, 1, 'Shows incremented' );
like( exception { RaceHorse->showed }, qr/^Instance variable needed/, "showed can't be called statically" );

# test 'lost'
ok( $gg->lost, 'Horse lost a race' );
is( $gg->{losses}, 1, 'Losses incremented' );
like( exception { RaceHorse->lost }, qr/^Instance variable needed/, "lost can't be called statically" );

# test 'standings'
( $gg->{wins}, $gg->{places}, $gg->{shows} ) = ( 4, 3, 2 );
is( $gg->standings, "4 wins, 3 places, 2 shows, 1 losses", "standings correct" );
like( exception { RaceHorse->standings }, qr/^Instance variable needed/, "standings can't be called statically" );
