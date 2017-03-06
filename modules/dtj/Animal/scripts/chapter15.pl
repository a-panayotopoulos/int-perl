#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Horse;
use Sheep;

my $tv_horse = Horse->new( name => 'Mr. Ed' );
$tv_horse->name('Mister Ed');
$tv_horse->color('grey');
print $tv_horse->name, ' is ', $tv_horse->color, "\n";

# TODO test calling Animal
