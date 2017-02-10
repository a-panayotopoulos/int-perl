#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 1;

BEGIN {
    use_ok( 'NatLang' ) || print "Bail out!\n";
}

diag( "Testing NatLang $NatLang::VERSION, Perl $], $^X" );
