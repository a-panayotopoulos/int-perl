#!perl
use warnings;
use strict;

use local::lib;
use Module::CoreList;

my @modules =  $Module::CoreList::version { 5.014002 };


foreach my $mod (@modules) {
	print "$mod : ". $Module::CoreList::released(Module::CoreList->first_release( $mod ))."\n";
}
