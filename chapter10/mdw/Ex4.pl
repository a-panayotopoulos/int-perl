#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use v5.12;

my $tablevel = 0;

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) {        # files or symbolic links
    print " " x $tablevel . $path . "\n";
  }
  if (-d $path) {
    my %directory;
    print " " x $tablevel . $path . ",";
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    if ( @names ){
	print " with contents:\n";
    } else {
	print " an empty directory\n";
    }
    $tablevel += 1;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      data_for_path("$path/$name");
    }
    $tablevel -= 1;
  }
  return undef;
}

my $file = shift;

data_for_path($file);
