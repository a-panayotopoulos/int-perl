package Oogaboogoo;

use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

my @day = qw(ark dip wap sen pop sep kir);
my @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

# documentation-shmockumentation
# oh, ok - lets bring out validation in to common code
# then we can have simpler versions of number_to_day_name
# and number_to_month_name

sub number_to_array_value {
  my $num = shift @_;
  my $array = shift @_;

  if ( !looks_like_number( $num ) ) {
    return undef;
  }

  if ( $num < 0 || $num > scalar @$array ) {
    return undef;
  }

  return ${$array}[$num];
}

sub number_to_day_name {
  my $num = shift @_;

  number_to_array_value( $num, \@day );
}

sub number_to_month_name {
  my $num = shift @_;

  number_to_array_value( $num, \@month );
}

1;

