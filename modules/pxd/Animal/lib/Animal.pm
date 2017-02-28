package Animal;

use 5.006;
use strict;
use warnings;
use Carp qw(croak);

sub default_color { "brown" }

sub sound { croak "subclass must define a sound" }

sub speak {
  my $self = shift;
  print "A '$self->name' says '$self->sound' \n";
}

sub named {
  ref(my $self = shift) and croak "Please give a class name";
  my $name = shift;
  my $new_class = { Name => $name, Color => $self->default_color };
  bless $new_class, $self;
}


# Default Getters/Setters

sub set_name {
  ref(my $self = shift) or croak "Please give a name";
  $self->{Name} = shift;
}

sub set_color {
  ref(my $self = shift) or croak "Please give a color";
  $self->{Color} = shift;
}

sub name {
  my $self = shift;
  ref $self ? $self->{Name} : "An <no_name>  $self";
}

sub color {
  my $self = shift;
  ref $self ? $self->{Color} : $self->default_color;
}

sub DESTROY {
  my $self = shift;
  print '[', $self->name, " has died.]\n";
}

1; # End of Animal
