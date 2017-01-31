use strict;
use warnings;

use parent qw(LivingCreature);

use Test::More tests => 2;

use_ok( 'Animal' ) || print "Bail out!\n";

eval { Animal->sound() } or my $at = $@;
like( $at, qr/define sound\(\)/, 'speak() dies with a message' );