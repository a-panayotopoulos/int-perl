#/usr/bin/perl

use strict;
use warnings;

my $dir = '/sdcard/git/int-perl/chapter03/dtj';

opendir( FILES, $dir ) or die $!;
my @files = readdir( FILES );

while ( 1 ) {
	chomp ( my $pattern = <STDIN> );
	last unless $pattern;
	eval {
			print "The results are: \n";
			print foreach map { "    $_\n" } grep { /$pattern/ } @files;
	}
}