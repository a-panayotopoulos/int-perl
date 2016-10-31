#!/usr/bin/perl
use strict;
use warnings;

my %total_bytes;
my %source_bytes;
while ( <> ) {
  my ( $source, $destination, $bytes ) = split;
  $total_bytes{$source}{$destination} += $bytes;
  $source_bytes{$source} += $bytes;
}

for my $source ( sort { $source_bytes{$b} <=> $source_bytes{$a} } keys %total_bytes ) {
  my $source_total = 0;
  for my $destination ( keys %{ $total_bytes{$source} } ) {
    $source_total += $total_bytes{$source}{$destination};
  }
  print "$source - $source_total\n";

  for
    my $destination ( sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} } )
  {
    print "$source => $destination:", " $total_bytes{$source}{$destination} bytes\n";
  }

  print "\n";
}
