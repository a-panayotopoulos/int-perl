#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use File::Spec::Functions;
use feature "say";

sub data_for_path {
    my($path, $threshold, $method) = @_;

    my $data = {};

    my @queue = ([$path, 0, $data]);

    my @methods = qw( depth_first breadth_first );
    
    while (my $next = shift @queue) {
        my ($local_path, $level, $ref) = @$next;
        my $basename = basename($local_path);

        $ref->{$basename} = do {
            if(-f $path or -l $local_path) { undef }
            else {
                my $hash = {};
                if ( grep( /^$method$/, @methods ) and $level < $threshold) {
                    opendir my($dh), $local_path;
                    my @new_paths = map { catfile($local_path, $_) } grep { ! /^\.\.?\z/ } readdir $dh;

                    if ( $method eq 'breadth_first' ) {
                        push @queue, map { [$_, $level + 1, $hash] } @new_paths;
                    }
                    elsif ( $method eq 'depth_first' ) {
                         unshift @queue, map { [$_, $level, $hash] } @new_paths;
                    }
                }
                $hash;
            }
        };
    }
    $data;
}

sub dump_data_for_path {
    my $path = shift;
    my $data = shift;
    my $count = shift // 0;
    my $indent = '    ' x $count;

    print $indent, $path; 

    if (not defined $data) {   
        return;
    }

    if (%$data) {
        foreach (sort keys %$data) {
            dump_data_for_path($_, $data->{$_}, $count + 1);
        }
    } else {
        say ", an empty directory";
    }
}

chdir '/home/pxd/perl/int-perl';
my $threshold = 2;
my $depth   = data_for_path('.', $threshold, 'depth_first');
my $breadth = data_for_path('.', $threshold, 'breadth_first');

say "Depth First Search Results :: ";
dump_data_for_path('.', $depth);

say "\n\nBreadth First Search Results :: ";
dump_data_for_path('.', $breadth);

