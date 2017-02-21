#!/usr/bin/perl

use 5.006;
use strict;
use warnings;
use lib './lib'; 
use My::List::Utils;
use Data::Dumper;

my @list = ( 1, 2, 3, 4, 5 );

my @shuffled = shuffled( @list );

print Dumper(@shuffled);
