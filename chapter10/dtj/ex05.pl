#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

my $dir = $ARGV[0] // '.';

# Rushed this one as I was running out of time - Don't be mean!
# Also perltidied it because it copy pasted weird from the book,
# but I've commented where my change is

print "breadth first\n";
print Dumper( data_for_path( $dir, 2, 'breadth-first' ) );

print "depth first\n";
print Dumper( data_for_path( $dir, 2, 'depth-first' ) );

sub data_for_path {
    my ( $path, $threshold, $type ) = @_;

    $type //= '';
    if ( $type ne 'breadth-first' && $type ne 'depth-first' ) {
        print "Unrecognised type, options are 'breadth-first' and 'depth-first', defaulting to breadth-first\n";
        $type = 'breadth-first';
    }

    my $data = {};

    my @queue = ( [ $path, 0, $data ] );

    while ( my $next = shift @queue ) {
        my ( $path, $level, $ref ) = @$next;

        my $basename = basename($path);

        $ref->{$basename} = do {
            if ( -f $path or -l $path ) { undef }
            else {
                my $hash = {};
                if ( $level < $threshold ) {
                    opendir my ($dh), $path;
                    my @new_paths =
                      map { catfile( $path, $_ ) }
                      grep { !/^\.\.?\z/ } readdir $dh;

                    # The bit that matters....
                    if ( $type eq 'breadth-first' ) {
                        push @queue,
                          map { [ $_, $level + 1, $hash ] } @new_paths;
                    }
                    else {
                        unshift @queue,
                          map { [ $_, $level + 1, $hash ] } @new_paths;
                    }
                }
                $hash;
            }
        };
    }

    $data;
}

