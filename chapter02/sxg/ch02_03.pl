#!perl
use warnings;
#use strict;

use Business::ISBN;

my $isbn = Business::ISBN->new( "9781449393090" );

#print the ISBN with hyphens at usual positions
print "ISBN : " . $isbn->as_string . "\n";

#print the group code and publisher code
print "Group code: " . $isbn->group_code . "\n";
print "Publisher code: " . $isbn->publisher_code . "\n";

