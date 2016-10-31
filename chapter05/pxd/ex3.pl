#!/usr/bin/perl

use strict;
use warnings;
use feature "say";


my %total;

while (<>) {
    next if m/^#/;
    my ($src, $dstn, $data) = split;
    $total{$src}{$dstn} += $data;
}

open ( my $fh, '>', 'coconet_updated.dat' ) or die "Could not open file: $!";

foreach my $src ( sort keys %total ) {
    say $fh $src;
    foreach my $dstn ( sort keys %{$total{$src}} ) {
        say $fh "\t$dstn\t$total{$src}{$dstn}";
    }
}

close($fh);

