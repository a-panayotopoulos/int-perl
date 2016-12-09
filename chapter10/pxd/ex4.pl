#!/usr/bin/perl

use strict;
use warnings;
use File::Spec qw(catfile);
use feature "say";

sub data_for_path {
    my $path = shift;
    if (-f $path or -l $path) { 
        return undef;
    }

    if (-d $path) {
        my %directory;
        opendir my $dh, $path or die "Cannot opendir $path: $!";
        my @names = readdir $dh;
        closedir $dh;

        foreach my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path( File::Spec->catfile($path,
$name) );
        }
        return \%directory;
    }
    warn "$path is neither a file nor a directory\n";
    return undef;
}

sub dump_data_for_path {
    my $path = shift;
    my $data = shift;
    my $count = shift // 0;
    my $indent = '    ' x $count;

    say $indent, $path; 

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

chdir '/home/pxd/perl/int-perl/chapter10';
dump_data_for_path('.', data_for_path('.'));

