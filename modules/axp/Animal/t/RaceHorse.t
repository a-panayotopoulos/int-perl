#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 31;
use Test::Fatal;
use File::Slurp qw ( read_file );
use JSON;
use constant STANDINGS => 'standings.json';

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

# test 'tie'
unlink STANDINGS if -e STANDINGS;
{
	my $hoss = RaceHorse->named( 'May The Hoss Be With You' )->tie( STANDINGS );
	( $hoss->{wins}, $hoss->{places}, $hoss->{shows}, $hoss->{losses} ) = ( 4, 3, 2, 1 );
	ok( !-e STANDINGS, 'Standings file not created until variable is out of context' );
}
{
	like( exception { RaceHorse->tie }, qr/^Instance variable needed/, "tie can't be called statically" );

	my $lilpony = RaceHorse->named( 'Twilight Sporkle' );
	like( exception { $lilpony->tie }, qr/^Standings file needed/, "need to provide filename" );
	like( exception { $lilpony->tie( '.' ) }, qr/^read_file '.' - sysopen: Permission denied/, "tie on invalid file" );
	$lilpony->won;
	like( exception { $lilpony->tie( STANDINGS ) }, qr/^Can't tie; standings already altered/, "need to tie before anything else" );

	$lilpony = RaceHorse->named( 'Twilight Sporkle' )->tie( STANDINGS );
	is( $lilpony->standings, "4 wins, 3 places, 2 shows, 1 losses", "standings correct" );
	$lilpony->won;
	my $data = from_json read_file STANDINGS;
	is( $data->{wins}, 4, 'Standings file not updated until variable is out of context' );
}
{
	my $nag = RaceHorse->named( 'Hoof Hearted' )->tie( STANDINGS );
	is( $nag->standings, "5 wins, 3 places, 2 shows, 1 losses", "standings correct after reload" );
}
unlink STANDINGS if -e STANDINGS;
