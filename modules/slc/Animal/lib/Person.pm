package Person;

use parent qw(LivingCreature);

sub speak {
  my $class = shift;
  my $sentence = shift;
  if ( defined $sentence ) {
    print "a $class says \"", $sentence, "\"\n";
  }
  else {
    $class->SUPER::speak();
  }
}

sub sound { 'hmmm hmm hmmmmmmm' }

1;
