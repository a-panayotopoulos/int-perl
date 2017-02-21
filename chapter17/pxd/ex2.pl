#!/usr/bin/perl

use strict;
use warnings;
use Oogaboogoo qw(:all);

my(undef, undef, undef, $mday, $mon, $year, $day) = localtime;

my $oo_day = day($day);
my $oo_mon = mon($mon);

printf "Today is %s %s %d %d on Earth.\n", $day, $mon, $mday, $year + 1900;
printf "Today is %s %s %d %d on Oogaboogoo.\n", $oo_day, $oo_mon, $mday, $year + 1900;

