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
    name     => 'Howell',
    hat      => 'Red',
    shirt    => 'White',
    position => 'Second Mate',
);

my @crew = ( \%gilligan_info, \%skipper_info, \%mr_howell);

my $format = "%-15s %-7s %-7s %-15s\n";
printf $format, qw(Name Shirt Hat Position);

foreach my $crewmember (@crew) {
    printf $format,
      $crewmember->{'name'},
      $crewmember->{'shirt'},
      $crewmember->{'hat'},
      $crewmember->{'position'};
}

&changeLocation( \@crew );

print "Report:\n";

foreach my $person (@crew) {
    print "$person->{name} at $person->{location}\n";
}

sub changeLocation() {
    my $crew = shift;
    for my $crewmember (@$crew) {
        if ( $crewmember->{name} eq "Howell" ) {
            $crewmember->{location} = "The Island Country Club";
        }
        else {
            $crewmember->{location} = "The Island";
        }
    }

}

