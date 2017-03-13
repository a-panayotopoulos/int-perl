#!perl -T
use 5.006;
use strict;
use warnings;
use Test::Builder::Tester tests => 13;
use Test::More 0.62;
use Test::Warn;

BEGIN {
  use_ok( 'Test::My::List::Util' ) || print "Bail out!\n";
}

# Test passing
test_out( "ok 1 - three is three" );
sum_ok( 3, 3, 'three is three' );
test_test( "Pass with custom test name" );

test_out( "ok 1 - Testing summed values" );
sum_ok( 3, 3 );
test_test( "Pass without test name" );

# Test failing
test_err( '/.*?Expected: 5, Actual 4./' );
test_out( "not ok 1 - four is five" );
test_fail( +1 );
sum_ok( 4, 5, 'four is five' );
test_test( "Fail with custom test name" );

test_err( '/.*?Expected: 5, Actual 4./' );
test_out( "not ok 1 - Testing summed values" );
test_fail( +1 );
sum_ok( 4, 5 );
test_test( "Fail without test name" );

# Test other types of data
test_err( '/.*?Actual value <potatoes> doesn\'t look like a number./' );
test_out( "not ok 1 - Testing summed values" );
test_fail( +1 );
sum_ok( 'potatoes', 0 );
test_test( 'Fail on non-numeric actual' );

test_err( '/.*?Expected value <potatoes> doesn\'t look like a number./' );
test_out( "not ok 1 - Testing summed values" );
test_fail( +1 );
sum_ok( 0, 'potatoes' );
test_test( 'Fail on non-numeric expected' );

test_out( "ok 1 - Testing summed values" );
sum_ok( '3', 3 );
test_test( "Allow string to number conversion" );

test_out( "ok 1 - Testing summed values" );
sum_ok( 4.5, 4.5 );
test_test( "Test decimals" );

test_out( "ok 1 - Testing summed values" );
sum_ok( 3, 3.0000 );
test_test( "Test decimal and integer equal" );

test_out( "ok 1 - Testing summed values" );
sum_ok( 'infinity', 'infinity' );
test_test( "Test infinity and beyond" );

test_err( '/.*?Expected: infinity, Actual 0./' );
test_out( "not ok 1 - Testing summed values" );
test_fail( +1 );
sum_ok( 0, 'infinity' );
test_test( "Infinity is actually treated as infinity" );

test_out( "ok 1 - Testing summed values" );
sum_ok( 1200, '1.2e3' );
test_test( "Test scientific numbers" );
