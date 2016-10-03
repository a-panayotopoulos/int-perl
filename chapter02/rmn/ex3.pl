use 5.014;
use strict;
use warnings;
use autodie;

use Business::ISBN;

my $isbn = Business::ISBN->new('9781449393090');
say "Group code     " . $isbn->group_code;
say "Publisher code " . $isbn->publisher_code;