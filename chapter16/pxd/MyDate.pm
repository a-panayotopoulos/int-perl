package MyDate;

use strict;
use warnings;
use Carp qw(carp);


sub new {
    my $class = shift;
    my $dd = shift // 1;
    my $mm = shift // 'Jan';
    my $yy = shift // 1970;

    my $self  = { 
        Day   => $dd,
        Month => $mm,
        Year  => $yy,
    };

    bless $self, $class;
}

sub AUTOLOAD {
    my @elements = qw(day month year);
    our $AUTOLOAD;
    if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @elements) {
        my $field = ucfirst $1;
        {
            no strict 'refs';
            *$AUTOLOAD = sub { $_[0]->{$field} };
        }
        goto &$AUTOLOAD;
    }
    (my $method = $AUTOLOAD) =~ s/.*:://s;
    carp "$_[0] does not understand $method\n";
}

1;
