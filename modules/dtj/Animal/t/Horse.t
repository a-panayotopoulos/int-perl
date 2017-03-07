#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

BEGIN { use_ok( 'Horse' ) }

is( Horse->new->sound, 'neigh', 'No dodgy acts of nature here' );
