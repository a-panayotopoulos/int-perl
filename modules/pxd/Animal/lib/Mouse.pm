package Mouse;

use 5.006;
use strict;
use warnings;
use parent qw(Animal);

sub sound { 'Squeak' }

sub speak {
  my $self = shift;
  $self->SUPER::speak;
  print "[but you can barely hear it!]\n";

}

1; # End of Mouse
