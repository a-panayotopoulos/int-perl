#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use RaceHorse;

my @horses;
push @horses, RaceHorse->new( name =>'Billy Boy');
push @horses, RaceHorse->new( name => 'Furious D');
push @horses, RaceHorse->new( name => 'My Little Pony');

$horses[0]->won;
$horses[1]->lost;
$horses[2]->lost;

foreach my $horse ( @horses ) {
  print $horse->name, ' has standings ', $horse->standings, ".\n";
}
