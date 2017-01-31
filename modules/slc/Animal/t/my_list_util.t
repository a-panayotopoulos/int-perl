use strict;
use warnings;

use Test::More tests => 7;

use_ok( 'My::List::Util' ) || print "Bail out!\n";

# sum

my @array = ( 1, 2, 3 );
is( My::List::Util->sum( @array ), 6, 'Sum works on array' );

@array = ( 1, undef, 3 );
is( My::List::Util->sum( @array ), 4, 'Sum works on array with undef value' );
 
my $array_ref = [1, 2, 3];
isnt( My::List::Util->sum( $array_ref ), 6, "Sum doesn't not work correctly on arrayref" );

my $ref = undef;
is( My::List::Util->sum( $ref ), 0, 'Sum works on array with only undef value' );

# shuffle

@array = ( 1..100 );
my @shuffled = My::List::Util->shuffle( @array );
isnt( join(",", @shuffled), join(",", @array), 'Numbers are shuffled' );

@array = ();
@shuffled = My::List::Util->shuffle( @array );
is( join(",", @shuffled), "", 'Numbers are shuffled' );
