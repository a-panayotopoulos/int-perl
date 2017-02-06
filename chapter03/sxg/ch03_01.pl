#!perl
use warnings;
use strict;

my $size = 1000;

my @files = grep { -s $_ > $size } @ARGV;

print "Files greater than $size:" . map { "$_\n" } @files;
print "\n";

