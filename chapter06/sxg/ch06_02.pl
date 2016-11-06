#!/usr/bin/perl
use strict;
use warnings;
use json;

my %total_bytes;
my %total_bytes_per_source;
e my $json_file = "storable";

if ( -e $json_file ) {
    open my $fh, '<:raw', $json_file;
    my $json_text = '';
    while (<$fh>) {
        $json_text .= $_;
    }
    $total_bytes = decode_json($json_text);

}

while (<>) {
    next if /^#/;
    my ( $source, $destination, $bytes ) = split;
    $total_bytes{$source}{$destination} += $bytes;
    $total_bytes_per_source{$source} += $bytes;
}

open my $fh, '>:utf8', $json_file;
print $fh to_json( $total_bytes, { pretty => 1 } );

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

