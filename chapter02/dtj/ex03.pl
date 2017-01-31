#!/usr/bin/perl

use strict;
use warnings;
use Business::ISBN;

my $int_perl = '9781449393090';
my $isbn = Business::ISBN->new( $int_perl );

printf "Group code: %s\n", $isbn->group_code;
printf "Publisher code: %s\n", $isbn->publisher_code;
