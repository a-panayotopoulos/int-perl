#!/usr/bin/perl

use strict;
use warnings;

use File::Find;
use Time::Local;

my $target_dow = 1;        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today

while ($dow != $target_dow) {
  # Back up one day
  $start -= $seconds_per_day;        # hope no DST! :-)
  if (--$dow < 0) {
    $dow += 7;
  }
}
my $stop = $start + $seconds_per_day;

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}


sub gather_mtime_between {
    my($start, $end) = @_;
    my @files;
    return (
        sub {
            my $timestamp = (stat $_)[9];
            if (!defined $timestamp) {
                print "Error running stat on $File::Find::name: $!\n";
                return;
            }
            if ( $timestamp >= $start && $timestamp <= $end) {
              push @files, $File::Find::name;
 	    }
        },
        sub {
            return @files
        } 
    );
}


