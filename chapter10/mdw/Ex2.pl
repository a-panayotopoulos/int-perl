#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;
use Benchmark qw(:all);

chdir "/tmp/";  # the default is our home directory

my @sorted;

cmpthese(1000000, {

	'old' => sub { @sorted = sort { -s $a <=> -s $b } glob '*'; },

	'swartz' => sub { @sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [$_, -s $_] } glob '*'; },
});
