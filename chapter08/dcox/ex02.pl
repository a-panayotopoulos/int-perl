#!/usr/bin/perl

use strict;
use warnings;

my %fhs;

while ( <> ) {
  my $line = $_;
  my $name = undef;

  $line =~ /(.*):.*/;
  $name = $1;

  if ( !exists $fhs{$name} ) {
    open my $fh, ">", $name;
    $fhs{$name} = $fh;
  }

  print { $fhs{$name} } $line;
}
