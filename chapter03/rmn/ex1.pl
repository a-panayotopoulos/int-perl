use 5.014;
use strict;
use warnings;
use autodie;

print map { "    $_\n" } grep { -s $_ < 1000 } @ARGV;