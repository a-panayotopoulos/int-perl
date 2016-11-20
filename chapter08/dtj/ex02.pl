#!/usr/bin/perl

use strict;
use warnings;

my %outputs;

# I feel it would be inapropriate to not leave a comment about all the random debugging I did 
# trying to find out why gilligan.info didn't start with:
#
# Gilligan: 1 coconut
# Gilligan: 1 banana
#
# like the book said it would, only the data file doesn't have those lines in it.
# In fact, Gilligan doesn't have any bloody coconuts or bannanas. /rant

while( <> ) {
    my ( $name ) = /^([^:]+):/;
    if ( !defined $name ) {
        print "Ignoring invalid line: '$_'";
        next
    }
    $name = lc $name;

    open $outputs{$name}, '>', "$name.info"
        or die "Cannot create a file for $name: $!"
            unless $outputs{$name};

    $outputs{$name}->print( $_ );
}


