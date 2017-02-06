#!/usr/bin/perl

use strict;
use warnings;

my @words =
    map $_->{original},
    sort { $a->{dict} cmp $b->{dict} }
    map { original  => $_, dict  => transform( $_ ) },
    @ARGV;

print join "\n", @words, "\n";

sub transform {
    my ( $string ) = @_;
    # I had fun when the dashes from the book weren't the right dashes
    # and so I seemed to have all my strings turned to 'a' 
    $string =~ tr/A-Z/a-z/;       # force all lowercase
    $string =~ tr/a-z//cd;        # strip all but a−z from the string
    return $string;
}
