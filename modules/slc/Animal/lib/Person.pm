package Person;

use parent qw(LivingCreature);

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

sub sound { 'hmmm hmm hmmmmmmm' }

1;
