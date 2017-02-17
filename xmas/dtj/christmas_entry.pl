#!/usr/bin/perl

use strict;
use warnings;

my $depth = $ARGV[0] // 50;
$depth = $depth < 5 ? 5 : $depth;

# Formatting is meant to be a hint but there isn't really enough code to do it and I'm not mean enough to pad it out
# I guess this isn't that specific to Perl and is instead just writing terrible terrible code
# Using so many maps also feels like cheating

                print
            join "\n", map
         { $_ . "X" . ( reverse $_
        ) } map { ( ' ' x @{$_}[0] ) .
    ( 'X' x ( @{$_}[1] / 2 ) ) }  map {
 [ int ( ( ( $depth * 2 ) + 1 - ( 1 * $_ ) )
/ 2 ), $_ ] } map {(0..$depth)[$_]} grep {$_ & 1} 
            0..$depth;

######################################################################
# One liner
######################################################################

print "\n\nPrinted from the one liner\n\n";
print join "\n", map { $_ . "X" . ( reverse $_ ) } map { ( ' ' x @{$_}[0] ) . ( 'X' x ( @{$_}[1] / 2 ) ) }  map { [ int ( ( ( $depth * 2 ) + 1 - ( 1 * $_ ) ) / 2 ), $_ ] } map {(0..$depth)[$_]} grep {$_ & 1} 0..$depth;

#######################################################################
# SPOILER
# Slightly readable version
######################################################################
print "\n\nPrinted from the more readable version\n\n";
my $width = ( $depth * 2 ) + 1;

# loop over odd numbers up to the depth
for my $line ( map {(0..$depth)[$_]} grep {$_ & 1} 0..$depth ) {
    my $whitespace = int ( ( $width - ( 1 * $line ) ) / 2 );
    # always print the middle stalk, the outside will always be symmetrical so x is the outside
    my $x = ( ' ' x $whitespace ) . ( 'X' x ( $line / 2 ) );
    print $x . "X" . ( reverse $x ) . "\n";
}
