#!/usr/bin/perl

use strict;
use warnings;
use File::Slurp;

# Autoflush for Windows!
$|=1;

my $regex_file = 'regex.txt';

my @regexes = map { eval { qr/$_/ } // die "Regex /$_/ is invalid: $@\n" } map { s/\R//gr; } read_file( $regex_file );

if ( !scalar @ARGV ) {
    print "Write some stuff and I'll check my regexes:\n"
}

while (<>) {
    my $line = $_;
    my @matched_regexes = grep { $line =~ $_ } @regexes;
    if ( scalar @matched_regexes ) {
        print "Match line $.: $line";
    }
}
