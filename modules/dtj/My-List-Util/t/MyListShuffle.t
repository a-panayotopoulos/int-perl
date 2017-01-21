#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 5;

# It would be nice to give up if either of these two fail
use_ok( 'My::List::Util' );
can_ok( 'My::List::Util', "shuffle" );

subtest 'Good list' =>  sub {
    plan tests => 1;
    my @input = ( 1, 2, 3, 4, 5, 6, 7, 8, 9 );
    my @output = My::List::Util::shuffle( @input );
    my @sorted_output = sort @output;
    is_deeply ( \@sorted_output, \@input, "Incorrect shuffle of decimal element in array"  );
};

subtest 'Single item in a list' =>  sub {
    plan tests => 2;
    is_deeply ( My::List::Util::shuffle( ( 1 ) ), ( 1 ), "Incorrect shuffle of single element in array"  );
    is_deeply ( My::List::Util::shuffle( 1 ), ( 1 ), "Incorrect shuffle of single element"  )
};

subtest 'Bad input' => sub {
    plan tests => 1;
    test_error( sub {  My::List::Util::shuffle() }, "Input was empty", "no input" );
};

sub test_error {
    my ( $sub, $error, $name ) = @_;
    my $actual;
    eval { $sub->() } or $actual = $@;
    like ( $actual, qr/$error/, "Expected error was not found in test: $name" );
}
