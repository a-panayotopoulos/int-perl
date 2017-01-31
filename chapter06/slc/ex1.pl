#!/usr/bin/perl

use strict;
use warnings;
use Storable qw( retrieve store );
use POSIX qw( strftime );
use Data::Dumper;

# Autoflush for Windows!
$|=1;

my $filename = 'running-totals.txt';

my $running_totals = {};
if ( -e $filename && -s _ ) {
    $running_totals = retrieve( $filename );
}

$running_totals->{data}->{$_->[0]}->{$_->[1]} += $_->[2] foreach map{ [split] } grep { /^[^#]/ } <>;

$running_totals->{info}{last_run} = strftime('%d/%m/%Y %H:%M:%S',localtime);
$running_totals->{info}{times_run}++;

store( $running_totals, $filename );

print "Current: \n", Dumper $running_totals;