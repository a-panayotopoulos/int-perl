#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use File::Slurp;
use POSIX qw( strftime );
use Data::Dumper;

# Autoflush for Windows!
$|=1;

my $filename = 'running-totals-json.txt';

my $running_totals = {};
if ( -e $filename && -s _ ) {
    $running_totals = decode_json( read_file( $filename) );
}

$running_totals->{data}->{$_->[0]}->{$_->[1]} += $_->[2] foreach map{ [split] } grep { /^[^#]/ } <>;

$running_totals->{info}{last_run} = strftime('%d/%m/%Y %H:%M:%S',localtime);
$running_totals->{info}{times_run}++;

write_file( $filename, encode_json( $running_totals ) );

print "Current: \n", Dumper $running_totals;