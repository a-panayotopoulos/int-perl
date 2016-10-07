#!/usr/bin/perl

use strict;
use warnings;
use Cwd;
use File::Spec;

my $cwd = getcwd();
my $curdir = File::Spec->catdir($cwd);

opendir(my $dh, $cwd) || die "Can't opendir $cwd: $!";

while (readdir $dh) {
   print "    $curdir" . "/$_\n";
}

closedir $dh;

