#!/usr/bin/perl

use strict;
use warnings;
use feature "say";

my $total;
my $origin;

while (<>) {
    next if /^#/; #Ignoring comments
    my ($source, $destination, $data) = split;
    $origin->{$source}               += $data;
    $total->{$source}->{$destination} += $data;
}

foreach my $source ( sort { $origin->{$b} <=> $origin->{$a} } keys %{$origin} ) 
{
    
    say "$source total: $origin->{$source}";
    foreach my $destination ( sort { $total->{$source}->{$b} <=> $total->{$source}->{$a} } keys %{$total->{$source}} ) 
    {
        say "$source => $destination: $total->{$source}->{$destination} data";
    }
}

