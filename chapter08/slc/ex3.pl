#!/usr/bin/perl

use strict;
use warnings;

print_folder_contents($_->{name}, $_->{dir_handle}) foreach map { opendir my $dh, $_ or die "Could not open directory: $!"; { name => $_, dir_handle => $dh } } @ARGV;

sub print_folder_contents {
    my ( $name, $dir_handle ) = @_;
    print "Folder [$name]\n";
    print "$_\n" foreach grep { !/^\.\.?$/ } readdir( $dir_handle );
    print "\n";
}
