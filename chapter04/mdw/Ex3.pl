#!/usr/bin/perl

use strict;
use warnings;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
        location => 'The Island',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
        location => 'The Island',
);
my %howells_info = (
        name     => 'Mrs. and Mr. Howell',
        hat      => 'Red',
        shirt    => 'Orange',
        position => 'Passengers',
        location => 'The Island',
);

$howells_info{location} = 'The Island Country Club';

my @crew = (\%gilligan_info, \%skipper_info, \%howells_info);

my $format = "%-15s %-7s %-7s %-15s %-7s\n"; 
printf $format, qw(Name Shirt Hat Position Location); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'},
                $crewmember->{'location'};
}

