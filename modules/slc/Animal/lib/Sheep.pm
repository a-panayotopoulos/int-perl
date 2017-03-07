package Sheep;

use Moose;
use namespace::autoclean;

extends 'Animal';

has 'sound' => ( is => 'ro', default => 'baaaah' );

sub default_colour {
    return 'white';
}

1;