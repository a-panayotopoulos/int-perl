#!/usr/bin/perl

use strict;
use warnings;
use feature "say";
use JSON;

my $file = 'current_total.dat';
my %total_ref;

if (-s $file) {
  open (my $fh, '<', $file);
  my $data;
  while my $line (<$fh>) {
    $data.= $line ;
  }
  close $fh;

  %total_ref = %{ from_json($data) };
}


while (<>) {
    next if /^#/; #Ignoring comments
    my ($source, $destination, $data) = split;
    $total_ref{$source}{$destination} += $data;
}


open( my $fh, '>', $file );
print $fh to_json( \%total_ref );
close $fh;

foreach my $source ( sort keys %total_ref ) 
{
    
    say "$source total: $total_ref{$source}";
    foreach my $destination ( sort keys %{$total_ref{$source}} ) 
    {
        say "$source => $destination: $total_ref{$source}{$destination} data";
    }
}

