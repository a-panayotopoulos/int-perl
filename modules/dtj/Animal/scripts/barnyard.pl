#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Cow;
use Horse;
use Sheep;
use Mouse;

my @animals;
print "Enter some Animals to go into the barnyard, one per line\n";
print "Press ctrl+d when finished\n";
while ( <> ) {
    chomp;
    my $input = $_;

    push @animals, $input;
}

foreach my $animal ( @animals ) {
    eval {
        $animal->speak;
    };

    if ( $@ ) {
        # It would be nicer to warn them when the entered the animals
        print "'$animal' was not a valid animal\n";
    }
}


