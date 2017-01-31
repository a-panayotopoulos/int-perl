package LivingCreature;

use Carp qw(croak);

sub named {
  my $class = shift;
  my $name = shift;
  my $self = { name => $name, colour => $class->default_colour };
  bless $self, $class;
}

sub default_colour {
    return 'unknown';
}

sub name {
  my $either = shift;
  ref $either
    ? $either->{name}
    : "an unnamed $either";
}

sub set_name {
    ref(my $self = shift) or croak "instance variable needed";
    $self->{name} = $_[0];
}

sub set_colour {
    ref(my $self = shift) or croak "instance variable needed";
    $self->{colour} = $_[0];
}

sub colour {
  my $either = shift;
  ref $either
    ? $either->{colour}
    : $either->default_colour();
}

sub speak {
  my $self = shift;
  print $self->name, ' goes ', $self->sound, "\n";
}

1;
