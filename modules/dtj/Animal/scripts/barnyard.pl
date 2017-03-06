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

    my $animal =  eval {
      return $input->new;
    };

    if ( $@ ) {
        print "'$input' was not a valid animal ($@) \n";
    }

    push @animals, $animal;
}

foreach my $animal ( @animals ) {
  $animal->speak;


}
