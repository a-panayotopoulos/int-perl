#!/usr/bin/perl

use strict;
use warnings;
use Regexp::Assemble;
use feature "say";

open my $fh, '<', $ARGV[0]?$ARGV[0]:'input.txt'
    or die "Can't open input.txt: $!";

my $patterns = Regexp::Assemble->new;

while (<$fh>) {
    chomp;
    $patterns->add($_) if eval { my $pattern = qr/$_/ };
}

my $all = $patterns->re;
say "Please enter lines to match: ";
while (<STDIN>) {
     say "Match at line $. | $_" if /$all/;
}
