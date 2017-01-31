package My::List::Util;
use strict;
use warnings;

use List::Util qw( );
$| = 1;

sub sum {
    my ( $package, @values ) = @_;
    return List::Util::sum0( @values );
}

sub shuffle {
    my ( $package, @values ) = @_;
    return List::Util::shuffle( @values );
}

1;
