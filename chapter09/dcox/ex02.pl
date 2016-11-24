#!/usr/bin/perl

use strict;
use warnings;

my @patterns;

open my $input_fh, "<", $ARGV[0] or die "Could not open $ARGV[0]: $1";

while ( <$input_fh> ) {
  chomp;
  my $pattern = eval { qr/$_/ };
  if ( $pattern ) {

    # only push if eval succeeded
    push @patterns, $pattern;
  }
}

if ( !@patterns ) {
  die "Pattern array is empty! :-(";
}

print "Okaydokay, got some patterns.\n";
print "Type some stuff and lets do some matching.\n";
print "<CRTL>+D to end this misery.\n";

while ( <STDIN> ) {
  foreach my $pattern ( @patterns ) {
    if ( /$pattern/ ) {
      print "Match [$pattern] at line $. : $_";
    }
  }
}

