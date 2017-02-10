#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'NatLang' ) || print "Bail out!\n";
}

diag( "Testing NatLang $NatLang::VERSION, Perl $], $^X" );
