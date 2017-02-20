package My::List::Util;

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT = qw(sum shuffle);

sub sum {
    my ( @elements ) = @_;
    my $sum;
    foreach my $i ( @elements ) {
        $sum += $i;
    }
    return $sum;
}

sub shuffle {
    my ( @elements ) = @_;
    return unless @elements;

    my $limit = @elements;
    while (--$limit) {
        my $j = int rand ($limit+1);
        @elements[$limit,$j] = @elements[$j,$limit];
    }
    return @elements;
}

1;

