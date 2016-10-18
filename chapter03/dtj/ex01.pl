#!/usr/bin/perl

use strict;
use warnings;

print map { "    $_\n" } grep { -s $_ < 1000 } @ARGV;