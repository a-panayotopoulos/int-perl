package t::Unit::ListUtil;

use strict;
use warnings;

use base qw(Test::Class);
use Test::More;

use Test::My::List::Util qw (sum_ok) ;

sub okay : Test  {
  sum_ok( 4, 4, "Success" );
}

sub not_okay : Test  {
  sum_ok( 4, 5, "This test will always fail, that proves things work." );
}

1;
