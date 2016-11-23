#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use File::Slurp;
use Regexp::Assemble;

# Autoflush for Windows!
$|=1;

my $regex_file = 'regex.txt';

my $ra = Regexp::Assemble->new;
$ra->add( $_ ) foreach read_file( $regex_file );

while (<>) {
    if ( /$ra/ ) {
        print "Match line $.: $_";
    }
}
