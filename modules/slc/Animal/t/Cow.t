use strict;
use warnings;

use Test::More tests => 3;

use_ok( 'Cow' ) || print "Bail out!\n";

is( Cow->sound(), 'moooo', "Cow sounds like moooo" );

my $output = '';
open TOOUTPUT, '>', \$output or die "Can't open TOOUTPUT: $!";
select TOOUTPUT;
Cow->speak();
is( $output, "a Cow goes moooo!\n", "A cow speaks moo" );