#!/usr/bin/perl

use strict;
use warnings;

# Autoflush for Windows!
$|=1;

my $basedir = $ARGV[0] // "C:/Windows";
opendir (DIR, $basedir) or die $!;
my @files = readdir(DIR);
my $input = undef;

while ( 1 ) {
    print "Enter regex: ";
    chomp ( $input = <STDIN> );
    last if $input eq "";
    print "Searching for /$input/\n";
    eval {
        print "Results:\n";
        print foreach map { "    $_\n" } grep { /$input/ } @files;
    };
    
    if ( $@ ) {
        print "Error with regex: $@\n";
    }
}

print "Exiting\n";
