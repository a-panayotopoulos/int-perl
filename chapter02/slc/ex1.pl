#!/usr/bin/perl
use strict;
use warnings;

use Cwd;
use File::Spec;

opendir (DIR, cwd) or die $!;
printf( "    %s\n", $_ ) foreach map { File::Spec->rel2abs( $_ ) } grep { -f $_ } readdir(DIR);
