#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

BEGIN { use_ok( 'Cow' ) }

is( Cow->sound, 'moooo', 'No dodgy acts of nature here' );
