#!/usr/bin/perl

use strict;
use warnings;
use My::List::Util qw(sum shuffle);
use feature "say";

my @list = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

say "Original List :: @list";

say "Sum of my list: " . sum(@list);

my @shuffled_list = shuffle(@list);

say "Shuffled List :: @shuffled_list ";
