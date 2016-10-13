#!/usr/bin/perl
use strict;
use warnings;

use Business::ISBN;
use Data::Dumper;

my $isbn = Business::ISBN->new('9781449393090');
print "Group Code: " . $isbn->group_code . "\n";
print "Publish Code: " . $isbn->publisher_code . "\n";
