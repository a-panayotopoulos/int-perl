#!/usr/bin/perl

use strict;
use warnings;

use Oogaboogoo::Date;

my($sec, $min, $hour, $mday, $mon, $year, $wday) = localtime;

my $day_name = day($wday);
my $mon_name = mon($mon);
$year += 1900;

print "Today is $day_name, $mon_name $mday, $year.\n";
