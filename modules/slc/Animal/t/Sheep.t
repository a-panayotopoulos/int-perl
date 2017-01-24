use strict;
use warnings;

use Test::More tests => 3;

use_ok( 'Sheep' ) || print "Bail out!\n";

is( Sheep->sound(), 'baaaah', "Sheep sounds like baaaah" );

my $output = '';
open TOOUTPUT, '>', \$output or die "Can't open TOOUTPUT: $!";
select TOOUTPUT;
Sheep->speak();
is( $output, "a Sheep goes baaaah!\n", "A Sheep speaks baaaah" );