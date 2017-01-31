use 5.014;
use strict;
use warnings;
use autodie;

while ( my $pattern = <STDIN> ) {
  chomp $pattern;
  last unless $pattern;
  
  eval{
    opendir my $dir, "C://Windows";
    say "\t$_" foreach grep { /$pattern/ } readdir $dir;
    closedir $dir;
  };
  
  if( $@ ) {
    say "ruhroh! $@";
  }
}