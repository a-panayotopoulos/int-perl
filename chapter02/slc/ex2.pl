#!/usr/bin/perl
use strict;
use warnings;

use Module::CoreList;

# I suspect this should work but I'll blame windows.
#print "$_\n" foreach map { sprintf( "%s => %s", $_, Module::CoreList::first_release( $_ ) ) } keys %{$Module::CoreList::version{5.01402}};

print "$_\n" foreach map { sprintf( "%s => %s", $_, Module::CoreList::first_release( $_ ) ) } keys %{$Module::CoreList::version{5.014}};

