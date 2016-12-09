#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use v5.12;

use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

my $settings = shift // 0;

my $data = data_for_path( "/home/mdw/int-perl/chapter10/", 2 );
print Dumper( $data );

sub data_for_path {
  my( $path, $threshold ) = @_;

  my $data = {};

  my @queue = ( [ $path, 0, $data ] );

  while( my $next = shift @queue ) {
    my( $path, $level, $ref ) = @$next;

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        if( $level < $threshold ) {
          opendir my ($dh), $path;
          my @new_paths = map {
            catfile( $path, $_ )
            } grep { ! /^\.\.?\z/ } readdir $dh;
	  if ( $settings == 1 ){
            push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          } else { 
	    unshift @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
	}
	}
        $hash;
      }
    };
  }

  $data;
}
