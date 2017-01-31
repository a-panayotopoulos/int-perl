#!/usr/bin/perl

use strict;
use warnings;
use Horse;
use Sheep;
use Person;

$| = 1;

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->set_name('Mister Ed');
$tv_horse->set_colour('grey');

print $tv_horse->name, ' is ', $tv_horse->colour, "\n";
print Sheep->name, ' colored ', Sheep->colour, ' goes ', Sheep->sound, "\n";

my $human = Person->named('Bob');
$human->speak("Hello there!");
$human->speak();
Person->speak( "Eh?" );