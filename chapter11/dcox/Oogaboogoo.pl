#!/usr/bin/perl

use strict;
use warnings;

require Oogaboogoo;

my ( $sec, $min, $hour, $mday, $mon, $year, $wday ) = localtime;

printf( "Today is %s %s %s %s\n",
        Oogaboogoo::number_to_day_name( $wday ),
        Oogaboogoo::number_to_month_name( $mon ),
        $mday, $year + 1900 );

