#!/usr/bin/perl

use strict;
use warnings;

use Regexp::Assemble;

my $patterns = Regexp::Assemble->new;

open my $input_fh, "<", $ARGV[0] or die "Could not open $ARGV[0]: $1";

while ( <$input_fh> ) {
  chomp;
  $patterns->add ( $_ );
}

my $pattern = $patterns->re;

print "Okaydokay, got combined pattern: $pattern.\n";
print "Type some stuff and lets do some matching.\n";
print "<CRTL>+D to end this misery.\n";

while ( <STDIN> ) {
  if ( /$pattern/ ) {
    print "Match [$pattern] at line $. : $_";
  }
}

