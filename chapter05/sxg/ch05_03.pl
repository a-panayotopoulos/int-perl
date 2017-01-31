#!/usr/bin/perl
use strict;
use warnings;

my %total_bytes;
while (<>) {
    my ( $source, $destination, $bytes ) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
    print "$source\n";
    foreach my $dest ( sort keys $total_bytes{$source} ) {
        print " $dest $total_bytes{$source}->{$dest}\n";
    }
}

