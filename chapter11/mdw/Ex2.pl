#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

require 'Island.pm';

my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime; 

my $day = Island::number_to_day_name( $wday -1 ); 
my $month = Island::number_to_month_name( $mon );

$year += 1900;

print "Today is $day $month $mday $year.\n";
