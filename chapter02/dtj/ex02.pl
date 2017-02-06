#!/usr/bin/perl

use strict;
use warnings;
use Module::CoreList;

my @modules = sort keys ( %{$Module::CoreList::version{5.014002}} );

foreach my $module ( @modules ) {
	my $version = Module::CoreList->first_release( $module );
	printf( "%s: %s\n", $module, $Module::CoreList::released{$version} );
}
