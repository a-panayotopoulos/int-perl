package Animal;

use Moose;
use namespace::autoclean;

extends 'LivingCreature';

sub default_colour {
    return 'brown';
}

__PACKAGE__->meta->make_immutable;

1;