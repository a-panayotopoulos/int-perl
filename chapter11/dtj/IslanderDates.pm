package IslanderDates;

use strict;
use warnings;
use Scalar::Util qw ( looks_like_number );

my @day = qw(ark dip wap sen pop sep kir);
my @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);
sub number_to_day_name {
    my $number = shift @_;
    eval {
        validate_number( $number, 0, 6 );
    };
    die "Error getting day name: $@" if $@;
    return $day[$number];
}
 
sub number_to_month_name {
    my $number = shift @_;
    eval {
        validate_number( $number, 0, 11 );
    };
    die "Error getting month name: $@" if $@;
    return $month[$number];
}

sub validate_number {
    my ( $number, $min, $max ) = @_; 

    # The below if statements are all Christmas presents for AlexD
    if ( !defined $number ){
        die "Number is required input";
    }

    if ( !looks_like_number $number ) {
        die "Input was not a number";
    }
    
    if ( $number < $min || $number > $max ) {
        die "Number was out of range $min - $max";
    }
}
