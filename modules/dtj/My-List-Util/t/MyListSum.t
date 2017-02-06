#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 8;

# It would be nice to give up if either of these two fail
use_ok( 'My::List::Util' );
can_ok( 'My::List::Util', "sum" );


subtest 'Single item in a list' =>  sub {
    plan tests => 2;
    is ( My::List::Util::sum( ( 1 ) ), 1, "Incorrect sum of single element in array"  );
    is ( My::List::Util::sum( 1 ), 1, "Incorrect sum of single element"  )
};

subtest 'Valid list of nums ' =>  sub {
    plan tests => 1;
    is ( My::List::Util::sum( ( 1, 2, 3 ) ), 6, "Incorrect sum of string num element in array"  );
};

subtest 'String of nums ' =>  sub {
    plan tests => 2;
    is ( My::List::Util::sum( qw( 1 ) ), 1, "Incorrect sum of single string num element in array"  );
    is ( My::List::Util::sum( qw( 1 2 3 ) ), 6, "Incorrect sum of string num element in array"  );
};

subtest 'Negative Numbers ' =>  sub {
    plan tests => 3;
    is ( My::List::Util::sum( -1 ), -1, "Incorrect sum of negative element in array"  );
    is ( My::List::Util::sum( 1, -2, 3 ), 2, "Incorrect sum including negative element in array"  );
    is ( My::List::Util::sum( -1, -2, -3 ), -6, "Incorrect sum of tring num element in array"  );
};

subtest 'Decimal Numbers ' =>  sub {
    plan tests => 2;
    is ( My::List::Util::sum( 1.5 ), 1.5, "Incorrect sum of decimal element in array"  );
    is ( My::List::Util::sum( 1.5, 2.5, 3.5 ), 7.5, "Incorrect sum of decimals in array"  );
};

subtest 'Bad input' => sub {
    plan tests => 4;
    test_error( sub {  My::List::Util::sum() }, "Input was empty", "no input" );
    test_error( sub {  My::List::Util::sum( { 1 => '2', 2 => '4' } ) }, "Invalid input: HASH", "hash" );
    test_error( sub {  My::List::Util::sum( "I'm a number!" ) }, "Invalid input: I'm a number!", "String" );
    test_error( sub {  My::List::Util::sum( ( "I'm a number", "And so am I!" ) ) }, "Invalid input: I'm a number", "list of strings" );
};

sub test_error {
    my ( $sub, $error, $name ) = @_;
    my $actual;
    eval { $sub->() } or $actual = $@;
    like ( $actual, qr/$error/, "Expected error was not found in test: $name" );
}
