#!/usr/bin/perl
use strict;
use warnings;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
);
my %mr_howell = (
	name     => 'Mr. Howell',
	hat      => 'Burgandy',
	shirt    => 'Denim',
	position => 'Chief Arms Officer',
);
my %mrs_howell = (
	name     => 'Mrs. Howell',
	hat      => 'Stormtrooper Helmet',
	shirt    => 'Bulletproof Vest',
	position => 'Master Knife thrower',
);
my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell, \%mrs_howell);

foreach my $crewmember (@crew) {
	$crewmember->{location} = $crewmember->{name} =~ /Howell$/ ? 'The Island Country Club' : 'The Island';
	print "$crewmember->{name} at $crewmember->{location}\n";
}
