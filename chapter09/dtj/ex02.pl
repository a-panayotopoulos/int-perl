#!/usr/bin/perl

use strict;
use warnings;
use File::Slurp;

my @lines = read_file( $ARGV[0] );
my @patterns;

foreach my $line ( @lines ) {
    my $pattern = eval { qr/$line/ };
    if ( $pattern ) {
        push @patterns, $pattern;
    } else {
        print "Skipping bad pattern '$pattern'";
    }
}

if ( !@patterns ) {
    die "No valid patterns in input file";
}

print "Patterns loaded, enter some input to match against.\n";

while ( <STDIN> ) {
    foreach my $pattern (@patterns) {
        print "Matched on line $. for pattern '$pattern'\n" if /$pattern/;
    }
}




