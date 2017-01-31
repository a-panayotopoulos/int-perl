#!/usr/bin/perl

use strict;
use warnings;
use Cwd;
use File::Spec;

my $cwd = getcwd;
opendir( my $dir, $cwd ) or die $!;

while ( readdir ( $dir ) ) {
	printf( "    %s\n", File::Spec->catfile( $cwd, $_ ) );
}
