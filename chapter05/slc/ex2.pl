#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(sum);

my $results;
$results->{$_->[0]}->{$_->[1]} += $_->[2] foreach map{ [split] } <>;

my $results_mod;
foreach my $outer ( sort { sum(values %{ $results->{$b} } ) <=> sum(values %{ $results->{$a} } ) } keys %$results ) {
    foreach my $inner ( sort { $results->{$outer}->{$b} <=> $results->{$outer}->{$a} } keys %{ $results->{$outer} } ) {
        printf( "%s => %s = %s\n", $outer, $inner, $results->{$outer}->{$inner} );
    }
}
