#!/usr/bin/perl

use strict;
use warnings;
use 5.014;

map { opendir my $dir , $_ or die "$!"; printdir( $_, $dir ); } @ARGV;

sub printdir {
    my ( $name, $dir ) = @_;
    say $name;
    say "\t$_" foreach readdir( $dir );
}
