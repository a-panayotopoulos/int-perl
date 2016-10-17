#!perl
use warnings;
use strict;

print "Enter a directory: \n";
chomp( my $directory = <STDIN> );
chdir $directory;



while (1) {
	print "Enter a regular expression(blank to ext):\n";
	chomp( my $regex = <STDIN> );
	
	if($regex eq "") { last; }

	print map { "File(s): $_\n" }
	  grep {
		eval { /$regex/ }
	  } glob(".* *");
}
