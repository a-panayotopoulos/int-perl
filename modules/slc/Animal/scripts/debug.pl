#!/usr/bin/perl

use strict;
use warnings;
use MyDate;

$| = 1;

sub UNIVERSAL::debug {
    my $self = shift;
    print time, " ", @_, "\n";
}

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

# Checks that "can" do something first?
$date->debug("This is some debug.");

$date->set_bob( 2015 );