#!/usr/bin/perl
use strict;
use warnings;

my %gilligan_info = ( name => 'Gilligan',
                      hat => 'White',
                      shirt => 'Red',
                      position => 'First Mate',
                      location => 'The Island',
                      );
my %skipper_info = ( name => 'Skipper',
                     hat => 'Black',
                     shirt => 'Blue',
                     position => 'Captain',
                     location => 'The Island',
                     );
my %mr_howell_info = ( name => 'Mr. Howell',
                       hat => 'Grey',
                       shirt => 'Cyan',
                       position => 'Passenger',
                       location => 'The Island',
                       );
my %mrs_howell_info = ( name => 'Mrs. Howell',
                        hat => 'Green',
                        shirt => 'Magenta',
                        position => 'Passenger',
                        location => 'The Island',
                        );

$mr_howell_info{'location'} = 'The Island Country Club';
$mrs_howell_info{'location'} = 'The Island Country Club';

my @crew = ( \%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info );

my $format = "%s at %5s\n";

foreach my $crewmember ( @crew ) {
  printf $format, $crewmember->{'name'}, $crewmember->{'location'};
}
