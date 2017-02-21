package Oogaboogoo::Date;
use strict;
use warnings;

use Exporter qw(import);

our @EXPORT = qw( day mon );

our %EXPORT_TAGS = (
  all => [ @EXPORT ],
);

my @day = qw(ark dip wap sen pop sep kir);
my @mon = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day {
  my $num = shift @_;
  die "$num is not a valid day number"
    unless $num >= 0 and $num <= 6;
  $day[$num];
}

sub mon {
  my $num = shift @_;
  die "$num is not a valid month number"
    unless $num >= 0 and $num <= 11;
  $mon[$num];
}

1;
