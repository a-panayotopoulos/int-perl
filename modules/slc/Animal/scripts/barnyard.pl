#!/usr/bin/perl

use strict;
use warnings;

$| = 1;

my %barnyard = ();

my $answer;
do {
    print "Do you want to add an[other] animal? ";
    $answer = get_input();
    if ( $answer =~ /^y|Y$/ ) {
        print "Which animal would you like to add? ";
        $barnyard{get_input()} += 1;
    }
    print "Your barnyard has: ", join( ",", map { "$barnyard{$_} $_" } keys %barnyard ), "\n";
} while ( $answer && $answer =~ /^y|Y$/ );

print "Your barnyard sounds like:\n";
foreach (keys %barnyard) {
    my $out = eval "require $_";
    if ( $@ ) {
        print "I don't know how $_ speaks, skipping.\n";
        next;
    }
    
    if ( $_->isa( 'Animal' ) ) {
        my $animal = $_;
        foreach ( 1..$barnyard{$animal} ) {
            print $animal->speak;
        }
    }
    else {
        print "$_ isn't an animal so I don't know how it speaks.\n";
    }
}


sub get_input {
    my $input = <STDIN>;
    chomp( $input );
    return $input;
}