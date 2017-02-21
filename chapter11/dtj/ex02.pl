#!/usr/bin/perl

use strict;
use warnings;

use IslanderDates qw( :all );

my ( $month, $year, $day ) = (localtime)[4..6];
print "Month: $month, year: $year, day: $day\n";
printf "Today is %s %s %s \n",
    number_to_day_name( $day ),
    number_to_month_name( $month ),
    $year + 1900;
