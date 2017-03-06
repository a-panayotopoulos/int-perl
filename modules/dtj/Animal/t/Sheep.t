#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

BEGIN { use_ok( 'Sheep' ) }

is( Sheep->new->sound, 'baaaah', 'No dodgy acts of nature here' );
