#!perl
use warnings;
use strict;

use local::lib;
use Module::CoreList;

my @modules =  $Module::CoreList::version { 5.014002 };

my $max_length = 0;
foreach my $module (@modules) {
	if (length $module > $max_length){
		$max_length = length $module
	}
}
foreach my $mod (@modules) {
	print "$mod : ". Module::CoreList->first_release( $mod )."\n";
}
