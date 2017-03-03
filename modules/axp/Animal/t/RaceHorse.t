#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 57;
use Test::Fatal;
use File::Slurp qw ( read_file );
use JSON;
use constant STANDINGS => 'standings.json';

BEGIN {
    require_ok( 'RaceHorse' ) || BAIL_OUT();
}

diag( "Testing RaceHorse $RaceHorse::VERSION, Perl $], $^X" );

# subroutines are defined
ok( defined &RaceHorse::wins, 'RaceHorse::wins is defined' );
ok( defined &RaceHorse::places, 'RaceHorse::places is defined' );
ok( defined &RaceHorse::shows, 'RaceHorse::shows is defined' );
ok( defined &RaceHorse::losses, 'RaceHorse::losses is defined' );
ok( defined &RaceHorse::won, 'RaceHorse::won is defined' );
ok( defined &RaceHorse::placed, 'RaceHorse::placed is defined' );
ok( defined &RaceHorse::showed, 'RaceHorse::showed is defined' );
ok( defined &RaceHorse::lost, 'RaceHorse::lost is defined' );
ok( defined &RaceHorse::standings, 'RaceHorse::standings is defined' );
ok( defined &RaceHorse::tie, 'RaceHorse::tie is defined' );

# test counstructor
my $gg = RaceHorse->new( name => 'Nonsequituriat' );
ok( $gg->DOES( "RaceHorse" ), 'RaceHorse object created' );

my $roWarning = "Cannot assign a value to a read-only accessor at reader";

# test 'wins'/'won'
is( $gg->wins, 0, 'Wins initialised to zero' );
like( exception { $gg->wins( 6 ) }, qr/^$roWarning RaceHorse::wins/, "wins is read-only" );
ok( $gg->won, 'Horse won a race' );
is( $gg->wins, 1, 'Wins incremented' );
like( exception { RaceHorse->won }, qr/^Instance variable needed/, "won can't be called statically" );
like( exception { RaceHorse->wins }, qr/^Instance variable needed/, "wins can't be called statically" );

# test 'places'/'placed'
is( $gg->places, 0, 'Places initialised to zero' );
like( exception { $gg->places( 6 ) }, qr/^$roWarning RaceHorse::places/, "places is read-only" );
ok( $gg->placed, 'Horse placed in a race' );
is( $gg->places, 1, 'Places incremented' );
like( exception { RaceHorse->placed }, qr/^Instance variable needed/, "placed can't be called statically" );
like( exception { RaceHorse->places }, qr/^Instance variable needed/, "places can't be called statically" );

# test 'shows'/'showed'
is( $gg->shows, 0, 'Shows initialised to zero' );
like( exception { $gg->shows( 6 ) }, qr/^$roWarning RaceHorse::shows/, "shows is read-only" );
ok( $gg->showed, 'Horse showed in a race' );
is( $gg->shows, 1, 'Shows incremented' );
like( exception { RaceHorse->showed }, qr/^Instance variable needed/, "showed can't be called statically" );
like( exception { RaceHorse->shows }, qr/^Instance variable needed/, "shows can't be called statically" );

# test 'losses'/'lost'
is( $gg->losses, 0, 'Losses initialised to zero' );
like( exception { $gg->losses( 6 ) }, qr/^$roWarning RaceHorse::losses/, "losses is read-only" );
ok( $gg->lost, 'Horse lost a race' );
is( $gg->losses, 1, 'Losses incremented' );
like( exception { RaceHorse->lost }, qr/^Instance variable needed/, "lost can't be called statically" );

# test constructor validation
foreach my $field ( qw( wins places shows losses ) ) {
	foreach my $value ( 'y', 6.6, undef ) {
		like( exception { RaceHorse->new( name => 'Nonsequituriat', $field => $value ) },
			qr/^Attribute \($field\) does not pass the type constraint because: Validation failed for 'Int'/,
			"Non-integer value for $field" );
	}
}

# test 'standings' (via initialised constructor)
$gg = RaceHorse->new( name => 'Nonsequituriat', wins => 4, places => 3, shows => 2, losses => 1 );
is( $gg->standings, "4 wins, 3 places, 2 shows, 1 losses", "standings correct" );
like( exception { RaceHorse->standings }, qr/^Instance variable needed/, "standings can't be called statically" );

# test 'tie'
unlink STANDINGS if -e STANDINGS;
{
	my $hoss = RaceHorse->new( name => 'May The Hoss Be With You' )->tie( STANDINGS );
	( $hoss->{wins}, $hoss->{places}, $hoss->{shows}, $hoss->{losses} ) = ( 4, 3, 2, 1 );
	ok( !-e STANDINGS, 'Standings file not created until variable is out of context' );
}
{
	like( exception { RaceHorse->tie }, qr/^Instance variable needed/, "tie can't be called statically" );

	my $lilpony = RaceHorse->new( name => 'Twilight Sporkle' );
	like( exception { $lilpony->tie }, qr/^Standings file needed/, "need to provide filename" );
	like( exception { $lilpony->tie( '.' ) }, qr/^read_file '.' - sysopen: Permission denied/, "tie on invalid file" );
	$lilpony->won;
	like( exception { $lilpony->tie( STANDINGS ) }, qr/^Can't tie; standings already altered/, "need to tie before anything else" );

	$lilpony = RaceHorse->new( name => 'Twilight Sporkle' )->tie( STANDINGS );
	is( $lilpony->standings, "4 wins, 3 places, 2 shows, 1 losses", "standings correct" );
	$lilpony->won;
	my $data = from_json read_file STANDINGS;
	is( $data->{wins}, 4, 'Standings file not updated until variable is out of context' );
}
{
	my $nag = RaceHorse->new( name => 'Hoof Hearted' )->tie( STANDINGS );
	is( $nag->standings, "5 wins, 3 places, 2 shows, 1 losses", "standings correct after reload" );
}
unlink STANDINGS if -e STANDINGS;
