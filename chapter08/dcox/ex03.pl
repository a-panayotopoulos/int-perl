#!/usr/bin/perl

use strict;
use warnings;

foreach my $dir ( @ARGV ) {
  if ( opendir my $dh, $dir ) {
    contents( $dir, $dh );
  }
  else {
    warn "Could not open directory: $dir: $!";
  }
}

sub contents {
  my ( $dir_name, $dir_handle ) = @_;

  print "$dir_name\n";

  foreach my $file ( readdir( $dir_handle ) ) {
    print "\t$file\n";
  }
}

