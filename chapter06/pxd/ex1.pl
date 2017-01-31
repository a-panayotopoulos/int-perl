#!/usr/bin/perl

use strict;
use warnings;
use feature "say";
use Storable;

my $file = 'current_total.dat';
my %total_ref = %{ retrieve $file } if -e $file;


while (<>) {
    next if /^#/; #Ignoring comments
    my ($source, $destination, $data) = split;
    $total_ref{$source}{$destination} += $data;
}

store \%total_ref, $file;

foreach my $source ( sort keys %total_ref ) 
{
    
    say "$source total: $total_ref{$source}";
    foreach my $destination ( sort keys %{$total_ref{$source}} ) 
    {
        say "$source => $destination: $total_ref{$source}{$destination} data";
    }
}

