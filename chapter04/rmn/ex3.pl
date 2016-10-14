use 5.014;
use strict;
use warnings;
use autodie;

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
my %mr_howell_info = (
	name     => 'Mr Howell',
	hat      => 'No',
	shirt    => 'body',
	position => 'knows',
	location => 'The Island',
);
my %mrs_howell_info = (
	name     => 'Mrs Howell',
	hat      => 'Or',
	shirt    => 'even',
	position => 'cares',
	location => 'The Island',
);

my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info);

$_->{location} = 'The Island Country Club' foreach grep { $_->{name} =~ m/Howell/ } @crew;

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, map { $crewmember->{$_} } qw( name shirt hat position );
}

say foreach map { "$_->{name} at $_->{location}" } @crew;
