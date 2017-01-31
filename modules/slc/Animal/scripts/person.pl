#!/usr/bin/perl

use strict;
use warnings;
use Person;

Person->speak();
Person->speak( "How are you?" );
Person->speak();
Person->speak( "I'm fine. How are you?" );
Person->speak( "Good." );