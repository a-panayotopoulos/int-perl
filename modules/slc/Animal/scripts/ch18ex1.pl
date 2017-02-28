#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use RaceHorse;

{
    my $racer = RaceHorse->named('Billy Boy');
    # record the outcomes: 3 wins, 1 show, 1 loss
    $racer->won;
    $racer->won;
    $racer->won;
    $racer->showed;
    $racer->lost;
    print $racer->name, ' has standings of: ', $racer->standings, ".\n";
}
my $racer1 = RaceHorse->named('Jacky Boy');
# record the outcomes: 3 wins, 1 show, 1 loss
$racer1->lost;
$racer1->lost;
$racer1->lost;
$racer1->lost;
$racer1->lost;
print $racer1->name, ' has standings of: ', $racer1->standings, ".\n";

{
    my $racer2 = RaceHorse->named();
    # record the outcomes: 3 wins, 1 show, 1 loss
    $racer2->won;
    $racer2->won;
    $racer2->won;
    $racer2->won;
    $racer2->showed;
    print $racer2->name, ' has standings of: ', $racer2->standings, ".\n";
}

my $racer3 = RaceHorse->named("Billy Boy");
# record the outcomes: 3 wins, 1 show, 1 loss
$racer3->won;
$racer3->won;
$racer3->won;
$racer3->won;
$racer3->showed;
print $racer3->name, ' has standings of: ', $racer3->standings, ".\n";

RaceHorse->all_time_standings();

