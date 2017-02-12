#!/usr/bin/perl

use strict;
use warnings;

use IslanderDates qw( number_to_day_name );

while ( <> ) {
    chomp;
    eval {
        print IslanderDates::number_to_day_name( $_ );
        print "\n";
    };
    print "Error: $@" if $@;
}
