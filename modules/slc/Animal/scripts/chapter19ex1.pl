#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Cow;
use Horse;
use Mouse;
use Person;
use Sheep;
use RaceHorse;

my $cow = Cow->new( name => 'Barney' );
$cow->speak();
print $cow->name, " is ", $cow->color, "\n";

my $horse = Horse->new( name => 'Bullseye' );
$horse->speak();
print $horse->name, " is ", $horse->color, "\n";

my $mouse = Mouse->new( name => 'Tigger', color => 'albino' );
$mouse->speak();
print $mouse->name, " is ", $mouse->color, "\n";

my $person = Person->new( name => 'Mike' );
$person->speak( "Hello..." );
$person->speak();
print $person->name, " is ", $person->color, "\n";

my $sheep = Sheep->new( name => 'Dolly' );
$sheep->speak();
print $sheep->name, " is ", $sheep->color, "\n";

my $racehorse = RaceHorse->new( name => 'Bob' );
$racehorse->speak();
print $racehorse->name, " is ", $racehorse->color, "\n";

$racehorse->won();
$racehorse->won();
$racehorse->won();
$racehorse->won();
$racehorse->won();
$racehorse->lost();
$racehorse->lost();
$racehorse->showed();
$racehorse->lost();

print $racehorse->name, ' has standings of: ', $racehorse->standings, ".\n";

$racehorse = undef;

RaceHorse->all_time_standings();

##   Barney goes mooooo
##   Barney is brown
##   Bullseye goes neigh
##   Bullseye is brown
##   Tigger goes squeak
##   [but you can barely hear it!]
##   Tigger is albino
##   Mike says "Hello..."
##   Mike goes hmmm hmm hmmmmmmm
##   Mike is white
##   Dolly goes baaaah
##   Dolly is white
##   Bob goes neigh
##   Bob is brown
##   Bob has standings of: 5 wins, 0 places, 1 shows, 3 losses.
##   All time standings:
##   Billy Boy            51 wins, 0 places, 15 shows, 9 losses
##   Unknown Racehorse    28 wins, 0 places, 6 shows, 0 losses
##   Bob                  5 wins, 0 places, 1 shows, 3 losses
##   Jacky Boy            0 wins, 0 places, 0 shows, 35 losses
