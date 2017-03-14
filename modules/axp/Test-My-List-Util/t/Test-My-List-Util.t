#!perl -T
use 5.006;
use strict;
use warnings;
use Test::Builder::Tester tests => 23;
use Test::More 0.62;
use Test::Warn;

BEGIN {
  use_ok( 'Test::My::List::Util' ) || print "Bail out!\n";
}

# Test passing
test_out( 'ok 1 - three plus two is five' );
sum_ok( 3, 2, 5, 'three plus two is five' );
test_test( 'Sum of two numbers' );

test_out( 'ok 1 - three is three' );
sum_ok( 3, 3, 'three is three' );
test_test( 'Single value' );

test_out( 'ok 1 - nothing is zero' );
sum_ok( 0, 'nothing is zero' );
test_test( 'Empty list sums to zero' );

# Test failing
test_err( '/.*?Expected: 5, Actual 4./' );
test_out( 'not ok 1 - two plus two is five' );
test_fail( +1 );
sum_ok( 2, 2, 5, 'two plus two is five' );
test_test( 'Failing sum of two numbers' );

test_err( '/.*?Expected: 5, Actual 4./' );
test_out( 'not ok 1 - four is five' );
test_fail( +1 );
sum_ok( 4, 5, 'four is five' );
test_test( 'Failing single value' );

test_err( '/.*?Expected: 5, Actual 0./' );
test_out( 'not ok 1 - nothing is five' );
test_fail( +1 );
sum_ok( 5, 'nothing is five' );
test_test( 'Failing empty list' );

# Test weirdness in parameters
test_err( '/.*?Need to give an expected value and a test name!/' );
test_out( 'not ok 1' );
test_fail( +1 );
sum_ok();
test_test( 'Fail on zero parameters' );

test_err( '/.*?Need to give an expected value and a test name!/' );
test_out( 'not ok 1' );
test_fail( +1 );
sum_ok( 'boh' );
test_test( 'Fail on one parameter' );

test_err( '/.*?Test description looks like a number. Probably a mistake. Failing./' );
test_out( 'not ok 1 - A test called <6>?' );
test_fail( +1 );
sum_ok( 6, 6 );
test_test( 'Fail without test name' );

test_err( '/.*?Expected value <potatoes> doesn\'t look like a number./' );
test_out( 'not ok 1 - Mmm, potatoes' );
test_fail( +1 );
sum_ok( 7477135, 'potatoes', 'Mmm, potatoes' );
test_test( 'Non-numeric expected' );

test_err( '/.*?Actual value <potatoes> doesn\'t look like a number./' );
test_out( 'not ok 1 - Mmm, potatoes' );
test_fail( +1 );
sum_ok( 1, 2, 'potatoes', 7477135, 'Mmm, potatoes' );
test_test( 'Non-numeric actual last' );

test_err( '/.*?Actual value <potatoes> doesn\'t look like a number./' );
test_out( 'not ok 1 - Mmm, potatoes' );
test_fail( +1 );
sum_ok( 1, 'potatoes', 3, 7477135, 'Mmm, potatoes' );
test_test( 'Non-numeric actual middle' );

test_err( '/.*?Actual value <potatoes> doesn\'t look like a number./' );
test_out( 'not ok 1 - Mmm, potatoes' );
test_fail( +1 );
sum_ok( 'potatoes', 2, 3, 7477135, 'Mmm, potatoes' );
test_test( 'Non-numeric actual first' );

# Test other types of data
test_out( 'ok 1 - string as number' );
sum_ok( '3', 3, 'string as number' );
test_test( 'Allow string to number conversion' );

test_out( "ok 1 - decimals" );
sum_ok( 4.5, 4.5, 'decimals' );
test_test( 'Test decimals' );

test_out( "ok 1 - decimal summation" );
sum_ok( 1.0, 3.2, 0.3, 4.5, 'decimal summation' );
test_test( 'Test decimal summation' );

test_out( 'ok 1 - decimal equals integer' );
sum_ok( 3, 3.0000, 'decimal equals integer' );
test_test( 'Test decimal and integer equal' );

test_out( 'ok 1 - to infinity and beyond' );
sum_ok( 'infinity', 'infinity', 'to infinity and beyond' );
test_test( 'Test infinity equality' );

test_err( '/.*?Expected: infinity, Actual 0./' );
test_out( 'not ok 1 - to infinity and beyond' );
test_fail( +1 );
sum_ok( 0, 'infinity', 'to infinity and beyond' );
test_test( 'Infinity is actually treated as infinity' );

test_out( 'ok 1 - to infinity and beyond' );
sum_ok( 1, 'infinity', 3, 4, 'infinity', 'to infinity and beyond' );
test_test( 'Test infinity summing, just for laughs' );

test_out( 'ok 1 - scientific' );
sum_ok( 1200, '1.2e3', 'scientific' );
test_test( 'Test scientific numbers' );

test_out( 'ok 1 - scientific summation' );
sum_ok( '1.2e3', '-5e2', '2e4', '2.07e4', 'scientific summation' );
test_test( 'Test scientific numbers' );
