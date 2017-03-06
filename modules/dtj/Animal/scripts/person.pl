#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Cow;
use Person;

my $cow = Cow->new;
$cow->speak;
$cow->speak( "I reject your reality and substitute my own" );

my $person = Person->new;
$person->speak;
$person->speak( "I reject your reality and substitute my own" );
