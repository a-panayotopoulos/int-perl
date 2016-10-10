#!/usr/bin/perl

use strict;
use warnings;
use Business::ISBN;

my $bookisbn = 9781449393090;

print "For the book with $bookisbn on the back:\n";

my $isbn = Business::ISBN->new( $bookisbn );

print "The group code is " . $isbn->group_code . "\n";

print "The publisher code is " . $isbn->publisher_code . "\n";


