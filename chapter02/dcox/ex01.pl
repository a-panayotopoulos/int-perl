#!/usr/bin/perl

use strict;
use warnings;

use File::Spec;
use Cwd qw ( getcwd );

my $cwd = getcwd();

foreach my $file ( glob( "*" ) ) {
  my $full_path = File::Spec->catfile( $cwd, $file );
  print "    $full_path\n";
}

