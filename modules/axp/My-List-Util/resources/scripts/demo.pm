use 5.012;
use strict;
use warnings;

use lib './lib'; # TODO: remove this after we learn how to install things

use My::List::Util qw ( :all );

my @in = qw( a b c d e f 6 5 4 3 2 1 );
my @out = shuffle( @in );
my @nums = qw( 8 6 7 5 3 0 9 );

say 'Before shuffle: [', join( ', ', @in ), ']';
say 'After shuffle: [', join( ', ', @out ), ']';
say 'Sum: [', join( ', ', @nums ), '] => ', sum( @nums );