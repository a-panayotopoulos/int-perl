#!/usr/bin/perl

use strict;
use warnings;

use Module::CoreList;

my @modules = sort keys %{ $Module::CoreList::version{5.014002} };

foreach my $module ( @modules ) {
  my $version = Module::CoreList->first_release( $module );
  my $release_date = $Module::CoreList::released{$version};
  print "$module: $release_date\n";
}

