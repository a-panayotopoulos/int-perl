#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Cow;
use Person;

Cow->speak;
Cow->speak( "I reject your reality and substitute my own" );

Person->speak;
Person->speak( "I reject your reality and substitute my own" );
