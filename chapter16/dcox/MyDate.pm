#!/usr/bin/perl
package MyDate;

use strict;
use warnings;

use Carp qw(croak);

use vars qw($AUTOLOAD);

sub new { bless {}, $_[0] }

sub AUTOLOAD {
  our $AUTOLOAD;

  ( my $method = $AUTOLOAD ) =~ s/.*:://s; # remove package name

  if ( $method eq "date" ) {
    return ( localtime )[3];
  }
  elsif ( $method eq "month" ) {
    return ( localtime )[4] + 1;
  }
  elsif ( $method eq "year" ) {
    return ( localtime )[5] + 1900;
  }
  else { # unknown method
    croak "$_[0] does not know how to $method\n";
  }
}

1;
