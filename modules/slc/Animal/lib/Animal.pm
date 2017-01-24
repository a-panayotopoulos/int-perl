package Animal;
use parent qw(LivingCreature);

sub sound {
  die 'You have to define sound() in a subclass'
}

1;