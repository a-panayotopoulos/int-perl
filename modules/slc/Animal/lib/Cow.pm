package Cow;

use Moose;
use namespace::autoclean;

extends 'Animal';

has 'sound' => ( is => 'ro', default => 'mooooo' );

__PACKAGE__->meta->make_immutable;

1;