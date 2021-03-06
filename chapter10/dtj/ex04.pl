#!/usr/bin/perl

use strict;
use warnings;

my $dir = $ARGV[0] // '.';
dump_data_for_path($dir, data_for_path($dir));

sub data_for_path {
    my $path = shift;
    if ( -f $path or -l $path ) {    # files or symbolic links
        return undef;
    }
    if ( -d $path ) {
        my %directory;
        opendir PATH, $path or die "Cannot opendir $path: $!";
        my @names = readdir PATH;
        closedir PATH;
        for my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path("$path/$name");
        }
        return \%directory;
    }
    warn "$path is neither a file nor a directory\n";
    return undef;
}

sub dump_data_for_path {
    my $path = shift;
    my $data = shift;
    my $indentation = shift // "";

    print $indentation;

    if ( not defined $data ) {    # plain file
        print "$path\n";
        return;
    }

    if ( scalar keys %{ $data } ) { # The directory has a contents
        print "$path, with contents:\n";
        foreach ( sort keys %$data ) {
            dump_data_for_path( $_, $data->{$_}, "$indentation\t" );
        }
    } else { # No contents
        print "$path, an empty directory\n";
    }
}
