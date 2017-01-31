#!usr/bin/perl -w

use strict;

use local::lib;
use Module::CoreList;
use feature 'say';


foreach my $mod ( sort keys $Module::CoreList::version{5.014002} ) {
  say $mod. ' ' . $Module::CoreList::released{ Module::CoreList::first_release( $mod )};
}


