package MyDate;

use strict;
use warnings;

use Carp qw(croak);

sub new {
    my ( $package , %args ) = @_;
    my $self = bless {}, $package;
    foreach my $key ( keys %args ) {
        my $setter = "set_$key";
        eval { $self->$setter( $args{$key} ) } or croak( "Unknown constructor parameter: [$key]\n" );
    }
    return $self;
}

sub AUTOLOAD {
    my @elements = qw( date month year );
    our $AUTOLOAD;
    if ($AUTOLOAD =~ /::(?:(set)_)?(\w+)$/ and grep $2 eq $_, @elements) {
        my $field = uc $2;
        {
            no strict 'refs';
            
            # set a "set" or "get" function
            *$AUTOLOAD = ( defined $1 ) ? sub { $_[0]->{$field} = $_[1] } : sub { $_[0]->{$field} // 'unknown' };
        }
        goto &$AUTOLOAD;
    }
    else {
        (my $method = $AUTOLOAD) =~ s/.*:://s; # remove package name
        return if $method eq "DESTROY";
        croak( "Unknown method: [$method]\n" );
    }
}

1;
