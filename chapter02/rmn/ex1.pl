use 5.014;
use strict;
use warnings;
use autodie;

use Cwd qw( getcwd abs_path );

opendir my $dh, getcwd;
say foreach 
  map { "   $_" } 
  map { abs_path $_ } 
  readdir $dh;
closedir $dh;

