#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../Animal/lib";

use My::List::Util;

my @shuffled = shuffle( 1..10 );
print join(",", @shuffled), "\n";

my $sum = sum( @shuffled );
print $sum, "\n";

@shuffled = My::List::Util::shuffle( 1..10 );
print join(",", @shuffled), "\n";

$sum = My::List::Util::sum( @shuffled );
print $sum, "\n";

