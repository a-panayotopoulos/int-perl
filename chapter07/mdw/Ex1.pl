#!/usr/bin/perl

use strict;
use warnings;
use File::Find;
use Time::Local;

my $target_dow = 1;
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my( $sec, $min, $hour, $day, $mon, $yr, $dow ) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

while ($dow != $target_dow) {
  $start -= $seconds_per_day;  
  if ( --$dow < 0 ) {
    $dow += 7;
  }
};

my $stop = $start + $seconds_per_day;

{
my @list;

sub gather_mtime_between {
	my ( $starttime, $endtime ) = @_;
	my $firstmethod = sub { 
		my ( @starting_directories ) = @_;
		foreach my $file ( $File::Find::name ) {
			if ( $starttime <= (stat $file)[9] && $endtime >= (stat $file)[9] ){
				push @list, $file;
			}
		}
	};
	my $secondmethod = sub {
		return @list;
	};
	return ( $firstmethod,  $secondmethod );
}
}

my ($gather, $yield) = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}
