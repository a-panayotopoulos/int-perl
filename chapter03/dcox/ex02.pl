#!/usr/bin/perl

use strict;
use warnings;

while ( 1 ) {
  chomp( my $pattern = <STDIN> );

  last if ( $pattern eq "" );

  print map { "    $_\n" }
    grep {
    eval { /$pattern/ }
    } glob( "/usr/lib/perl5/DataCash/*" );
}
