use 5.014;
use strict;
use warnings;
use autodie;

use Module::CoreList;
use List::Util qw( max );

use Data::Dumper;

my %module_release = map{ $_ => Module::CoreList::first_release( $_ ) } 
                              Module::CoreList::find_modules( qr/.*/, '5.014002' );

my $ml = max map { length } keys %module_release;

printf( "%${ml}s | %s\n", $_, $module_release{$_} ) foreach sort keys %module_release;