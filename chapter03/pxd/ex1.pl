#!/usr/bin/perl -w

use strict;

print "The following files are < 1000B\n", map { " " x4,"$_\n" } grep { -s $_ < 1000 } @ARGV;

