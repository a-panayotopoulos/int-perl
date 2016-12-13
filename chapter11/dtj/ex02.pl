#!/usr/bin/perl

use strict;
use warnings;

require 'IslanderDates.pm';

my ( $month, $year, $day ) = (localtime)[4..6];
print "Month: $month, year: $year, day: $day\n";
printf "Today is %s %s %s \n", 
    IslanderDates::number_to_day_name( $day ),
    IslanderDates::number_to_month_name( $month ),
    $year + 1900;
