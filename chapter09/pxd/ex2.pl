#!/usr/bin/perl

use strict;
use warnings;

use feature "say";

open my $fh, '<', $ARGV[0]?$ARGV[0]:'input.txt'
    or die "Can't open input.txt: $!";

my @patterns;

while (<$fh>) {
    chomp;
    my $pattern = eval { qr/$_/ }; 
    if (defined $pattern) {
    	push @patterns, $pattern; 
    }

}

if (scalar  @patterns == 0) {
	say "Nothing to match to... Provide a file will regular expressions to match to..";
	exit 0;
}

say "Please enter lines to match: ";
while (<STDIN>) {
 foreach my $pattern (@patterns) {
     say "Match at line $. | $_" if /$pattern/;
 }
}
