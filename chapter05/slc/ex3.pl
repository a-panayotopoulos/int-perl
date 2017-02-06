#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw(sum);

my $results;
$results->{$_->[0]}->{$_->[1]} += $_->[2] foreach map{ [split] } <>;

open(my $fh, '>', 'test.out');

foreach my $source ( sort keys %$results ) {
    print $fh "$source\n";
    foreach my $dest ( sort keys %{ $results->{$source} } ) {
        print $fh "  $dest $results->{$source}->{$dest}\n";
    }
}

close $fh;
