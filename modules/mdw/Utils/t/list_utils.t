#!perl

use 5.006;
use strict;
use warnings;

use Test::More tests => 7;

use_ok( 'My::List::Utils' ) || print "Bail out!\n";

my @list = ( 1, 2, 3, 4, 5 );

is( My::List::Utils->sum( @list ), 15, 'Can add up correctly' );

@list = ( 1, 2, 3, 4, -5, undef, "a" );

is( My::List::Utils->sum( @list ), 5, 'Can add up correctly when given incorrect values' );

@list = undef;

is( My::List::Utils->sum( @list ), 0, 'Can add up correctly when given no values' );

@list = 1;

is( My::List::Utils->sum( @list ), 1, 'Can add up correctly when given one value' );

@list = ( 1, 2, 3, 4, 5 );
my @shuffled = My::List::Utils->shuffled( @list );
is( @shuffled, 5, 'List is the same size once shuffled' );

@list = ( 1, 2, 3, 4, 5 );
@shuffled = My::List::Utils->shuffled( @list );
@shuffled = sort @shuffled;
@list = sort @list;
is( @shuffled, @list, 'Contains the same list when sorted.' );
