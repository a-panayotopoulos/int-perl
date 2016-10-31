#!/usr/bin/perl
use strict;
use warnings;

my %total_bytes;
while ( <> ) {
  my ( $source, $destination, $bytes ) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

for my $source ( sort keys %total_bytes ) {
  my $source_total = 0;
  for my $destination ( keys %{ $total_bytes{$source} } ) {
    $source_total += $total_bytes{$source}{$destination};
  }
  print "$source\n";

  for my $destination ( sort keys %{ $total_bytes{$source} } ) {
    print "\t$destination:", " $total_bytes{$source}{$destination}\n";
  }
}
