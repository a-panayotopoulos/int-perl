#!/usr/bin/perl -w

use strict;
use Business::ISBN;
use feature 'say';

my $isbn = Business::ISBN->new("9780596102067");

say "Intermediate Perl - First edition";
say "Publisher code  :: ". $isbn->publisher_code;
say "Group code :: ". $isbn->group_code;
