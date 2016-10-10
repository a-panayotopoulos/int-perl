#!/usr/bin/perl

use strict;
use warnings;

use Business::ISBN;

my $intermediate_perl = "9781449393090";

my $isbn = Business::ISBN->new( $intermediate_perl );

print "Intermediate Perl ISBN: " . $intermediate_perl . "\n";
print "Group Code: " . $isbn->group_code . "\n";
print "Publisher Code: " . $isbn->publisher_code . "\n";

