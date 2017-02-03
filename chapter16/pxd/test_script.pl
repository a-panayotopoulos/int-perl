#!/usr/bin/perl

use strict;
use MyDate;

print "=====================================================================\n";
print "                         Exercise 1\n";
print "=====================================================================\n";


my $myDate1 = MyDate->new();
printf "Default Date :: %s %d, %d\n", $myDate1->month, $myDate1->day, $myDate1->year;


my $myDate2 = MyDate->new(3, 'February', 2017);
printf "Initialised Date :: %s %d, %d\n", $myDate2->month, $myDate2->day, $myDate2->year;


print "=====================================================================\n";
print "                         Exercise 2\n";
print "=====================================================================\n";

#Call a field which doesn't exist
my $fail_case = $myDate1->dayofweek;

sub UNIVERSAL::debug {
    my ( $self, $msg) = @_;
    my $time = localtime;
    print "$time $msg\n";
}

$myDate1->debug('Test');
