package LivingCreature;

use 5.006;
use strict;
use warnings;


sub speak {
  my ( $self ) = @_;
  if ($self) {
    print "$self  goes '$self' \n";
  } else {
    print "$self goes '$self->sound' \n";
  }
}


1; # End of LivingCreature
