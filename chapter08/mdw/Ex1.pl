#!/usr/bin/perl

use strict;
use warnings;
use IO::Tee;
use Time::Piece;

my $dt = localtime;

open my $file_fh, '>', 'file.txt' or die "could not open file.txt: $!";
open my $string_fh, '>', \ my $string;
my $tee_fh = IO::Tee->new( $file_fh, $string_fh );

my %handle_selector = ( 
			"file" =>  $file_fh,
			"string" => $string_fh,
			"both" => $tee_fh
);

my $imput = shift;

my $chosen_one = $handle_selector{$imput};

my $date = $dt->day_of_month . " of " . $dt->fullmonth;
my $day = $dt->fullday;

print $chosen_one "the date is $date and it is a $day\n";

print $string if $string;
