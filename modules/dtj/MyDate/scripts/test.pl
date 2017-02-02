#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use MyDate;

print "Date: " . MyDate::date() . "\n";
print "Month: " . MyDate::month() . "\n";
print "Year: " . MyDate::year() . "\n";
print "StarDate: " . MyDate::StarDate() . "\n";
