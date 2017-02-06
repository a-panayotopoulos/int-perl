#!/usr/bin/perl

use strict;
use warnings;

require 'IslanderDates.pm';

while ( <> ) {
    chomp;
    eval {
        print IslanderDates::number_to_day_name( $_ );
        print "\n";
    };
    print "Error: $@" if $@;
}

