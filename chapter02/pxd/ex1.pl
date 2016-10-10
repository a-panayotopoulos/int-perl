#!/usr/bin/perl -w

use strict;

use File::Spec;
use Cwd qw( getcwd );
use feature 'say';

my $dir = getcwd();

foreach my $file ( glob("*") ) {
  say "    ", File::Spec->catfile( $dir, $file ); 
}
