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

my %mrhowell_info = (
	name     => 'Mr. Howell',
        hat      => 'Violet',
	shirt    => 'Green',
	position => 'Passenger',
);
my %mrshowell_info = (
	name     => 'Mrs. Howell',
	hat      => 'Pink',
	shirt    => 'Cyan',
	position => 'Passenger',
);


my @crew = (\%gilligan_info, \%skipper_info, \%mrhowell_info, \%mrshowell_info);


my $format = "%-15s %-7s %-7s %-15s %-23s\n"; 

printf $format, qw(Name Shirt Hat Position Location); 


foreach my $crewmember (@crew) {

  if ( $crewmember->{name} =~ /Howell/ ) {
    $crewmember->{location} = 'The Island Country Club';
  }
  else {
    $crewmember->{location} = 'The Island';
  }

  printf $format, 
	$crewmember->{'name'}, 
	$crewmember->{'shirt'}, 
	$crewmember->{'hat'}, 
	$crewmember->{'position'},
	$crewmember->{'location'};
}

