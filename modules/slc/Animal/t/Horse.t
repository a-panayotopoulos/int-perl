use strict;
use warnings;

use Test::More tests => 3;

use_ok( 'Horse' ) || print "Bail out!\n";

is( Horse->sound(), 'neigh', "Horse sounds like neigh" );

my $output = '';
open TOOUTPUT, '>', \$output or die "Can't open TOOUTPUT: $!";
select TOOUTPUT;
Horse->speak();
is( $output, "a Horse goes neigh!\n", "A horse speaks neigh" );