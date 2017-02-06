#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use IO::Tee;

my $scalar_opt;
my $file_opt;

GetOptions( "scalar" => \$scalar_opt,
            "file" => \$file_opt, ) or die "Error in command line arguments";

my $filename = 'ex01.out';

my $fh;
my $scalar;
if ( $scalar_opt && $file_opt ) {
    open my $file_handle, '>', $filename 
        or die "Error opening the file: $!";
    open my $scalar_handle, '>', \$scalar;
    $fh = IO::Tee->new( $file_handle, $scalar_handle );
} elsif ( $scalar_opt ) {
    open $fh, '>', \$scalar;
} elsif ( $file_opt ) {
    open $fh, '>', $filename 
        or die "Error opening the file: $!";
} else {
    die "Needed at least one of the scalar or file options";
}

printf $fh "The date is: %s\n", scalar localtime;

print $scalar if ( $scalar_opt );


