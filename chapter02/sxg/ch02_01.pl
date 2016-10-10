#!perl
use warnings;
use strict;

use File::Spec;

my $directory = '.';

opendir (DIR, $directory) or die $!;

foreach my $file (readdir DIR) {
	
	# print the absolute path too.
	print File::Spec->catfile( $directory, $file ) . " :: " . File::Spec->rel2abs($directory, $file) . "\n";

}

closedir(DIR);
