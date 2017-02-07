#!/usr/bin/perl

use strict;
use warnings;
use MyDate;

$| = 1;

my $date = MyDate->new( date => 07, month => 2, year => 2017 );
print "Date: ", $date->date(), "\n";
print "Month: ", $date->month(), "\n";
print "Year: ", $date->year(), "\n";

$date = MyDate->new( date => 07, month => 2 );
print "Date: ", $date->date(), "\n";
print "Month: ", $date->month(), "\n";
print "Year: ", $date->year(), "\n";

$date->set_date( 25 );
$date->set_month( 12 );
$date->set_year( 2015 );

print "Date: ", $date->date(), "\n";
print "Month: ", $date->month(), "\n";
print "Year: ", $date->year(), "\n";

$date->set_bob( 2015 );