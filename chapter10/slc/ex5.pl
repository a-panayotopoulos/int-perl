#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

my @log = ();
my $data = data_for_path( "C:/Data/int-perl/", 100, 'depth-first', \@log );
print "depth-first\n", join( "\n", @log ), "\n";

@log = ();
$data = data_for_path( "C:/Data/int-perl/", 100, 'breadth-first', \@log );
print "breadth-first\n", join( "\n", @log ), "\n";

sub data_for_path {
  my( $path, $threshold, $traversal_type, $tmp_log ) = @_;

  my $data = {};

  my @queue = ( [ $path, 0, $data ] );

  while( my $next = shift @queue ) {
    my( $path, $level, $ref ) = @$next;
    
    push @$tmp_log, "Level [$level] => Name [$path]";

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        if( $level < $threshold ) {
          opendir my ($dh), $path;
          my @new_paths = map {
            catfile( $path, $_ )
            } grep { ! /^\.git/ } grep { ! /^\.\.?\z/ } readdir $dh;

          my @tmp_for_queue = map { [ $_, $level + 1, $hash ] } @new_paths;
          if ( defined $traversal_type && $traversal_type eq 'depth-first' ) {
            unshift @queue, @tmp_for_queue;
          } else {
            push @queue, @tmp_for_queue;
          }
        }
        $hash;
      }
    };
  }

  $data;
}