#!/usr/bin/perl -w

use strict;
use feature "say";

my $dir = "/usr/lib/perl5/DataCash/*";

#opendir(D, "$dir") || die "Can't open directory $dir: $!\n";
#my @files = readdir($dir);
#closedir($dir);
#my @files = glob $dir;

my @files = </usr/lib/perl5/DataCash/*>;

my $user_regex;

if ( scalar @ARGV > 0 ) {
  say "You can't do that!";
  exit 1;
}

say "Please enter a regex to match or type quit to exit: ";

while ( chomp (  $user_regex = <STDIN> ) ) {

  if ( !$user_regex || ($user_regex =~ /quit/  )) {
	say "Please enter a regex to proceed...";
	next;
  }

  my @hits;
  eval {
   for my $file( @files) {
   	if ($file =~ /$user_regex/) {
		push @hits, $file;
	}
   }
  };
  if ( $@ ) {
    say "Regex is not valid. Try again! $@ $!";
  } 

  say "Matched files : " , map{$_,"\n"} @hits;
  say "Please press enter to continue....";
}
