package My::List::Util;
use strict;
use warnings;

use Exporter qw(import);

our @EXPORT = qw( sum shuffle );

use List::Util qw( );
$| = 1;

sub sum {
    my ( @values ) = @_;
    return List::Util::sum0( @values );
}

sub shuffle {
    my ( @values ) = @_;
    return List::Util::shuffle( @values );
}

1;
