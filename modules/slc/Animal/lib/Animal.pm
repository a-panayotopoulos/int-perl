package Animal;
use parent qw(LivingCreature);

sub default_colour {
    return 'brown';
}

sub sound {
  die 'You have to define sound() in a subclass'
}

1;