#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use v5.12;


my @unsorted = <>;


my @sorted = map { $_->[0] }
		 sort { $a->[1] cmp $b->[1] }
		 map { [ $_->[0], $_->[1] =~ tr/a-z//cdr ] }
          	 map  { [$_, tr/A-Z/a-z/r ] }
               	 @unsorted;


print @sorted;
