#!/usr/bin/perl
use warnings;
use strict;

use lib './lib'; 
use My::Date;

my $date = My::Date->new();
$date->day("Today\n");
$date->month("This Month\n");
$date->year("This Year\n");
print $date->day;
print $date->month;
print $date->year;
print $date->false
