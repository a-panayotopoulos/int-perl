package Person;

use Moose;
use namespace::autoclean;

extends 'LivingCreature';

has 'sound' => ( is => 'ro', default => 'hmmm hmm hmmmmmmm' );

sub default_colour {
    return 'white';
}

sub speak {
  my $either = shift;
  my $sentence = shift;
  if ( defined $sentence ) {
    print $either->name(), " says \"", $sentence, "\"\n";
  }
  else {
    $either->SUPER::speak();
  }
}

__PACKAGE__->meta->make_immutable;

1;
