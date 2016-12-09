#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

my $data = data_for_path( "/home/dcox/workspace/int-perl/chapter10", 2, $ARGV[0] );
print Dumper( $data );

sub data_for_path {
  my $path = shift;
  my $threshold = shift;
  my $search_type = shift // 'breadth-first';

  my $data = {};

  my @queue = ( [ $path, 0, $data ] );

  while ( my $next = shift @queue ) {
    my ( $path, $level, $ref ) = @$next;

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if ( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        if ( $level < $threshold ) {
          opendir my ( $dh ), $path;
          my @new_paths = map { catfile( $path, $_ ) } grep { !/^\.\.?\z/ } readdir $dh;

          if ( $search_type eq 'depth-first' ) {
            unshift @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          }
          else { # breadth-first
            push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          }
        }
        $hash;
      }
    };
  }

  $data;
} ## end sub data_for_path

