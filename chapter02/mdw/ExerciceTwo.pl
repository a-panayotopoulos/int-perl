#!/usr/bin/perl

use strict;
use warnings;
use Module::CoreList;

my $modules = $Module::CoreList::version{5.014002};

foreach my $module ( keys %$modules ){
	my $firstversion = Module::CoreList->first_release($module);
	print $module . " was first released on the date " . $Module::CoreList::released{$firstversion} . "\n" ;
}

