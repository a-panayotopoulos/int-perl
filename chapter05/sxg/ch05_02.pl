#!/usr/bin/perl
use strict;
use warnings;

my %total_bytes;
my %total_bytes_per_source;

while (<>) {
    next if /^#/;
    my ( $source, $destination, $bytes ) = split;
    $total_bytes{$source}{$destination} += $bytes;
    $total_bytes_per_source{$source} += $bytes;
}

my @sorted_sources = sort { $a <=> $b } keys %total_bytes_per_source;

for my $source (@sorted_sources) {
    my @destinations =
      sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} }
      keys %{ $total_bytes{$source} };
    print "$source: $total_bytes_per_source{$source} total bytes sent\n";
    for my $destination (@destinations) {
        print " $source => $destination:",
          " $total_bytes{$source}{$destination} bytes\n";
    }
    print "\n";
}

