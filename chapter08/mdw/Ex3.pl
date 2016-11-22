#!/usr/bin/perl

use strict;
use warnings;

sub new_dh {
        my ( $directory_name ) = @_;
        opendir my $new_dh, $directory_name or die "Could not open $directory_name: $!";
        return $new_dh
}

foreach my $arg (@ARGV) {
	my ( $dname ) = $arg;
	my $dh  = new_dh( $dname );
	while (readdir $dh) {
		print "$dname has the file $_\n";
	}
	closedir $dh;
}
