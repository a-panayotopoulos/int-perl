#!/usr/bin/perl
use warnings;
use strict;

use lib './lib'; 
use My::Date;

sub UNIVERSAL::debug {
 my $time = localtime;  
  print "$time!\n";
};

my $date = My::Date->new();
$date->day("Today\n");
$date->month("This Month\n");
$date->year("This Year\n");
print $date->day;
print $date->month;
print $date->year;
$date->debug;
print $date->false;
