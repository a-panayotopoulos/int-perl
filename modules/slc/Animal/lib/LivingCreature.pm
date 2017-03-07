package LivingCreature;

use Moose;
use namespace::autoclean;

has 'name'  => ( is => 'rw' );
has 'color' => ( is => 'rw', default => sub { shift->default_colour() } );
has 'sound' => ( is => 'ro', default => sub {
  confess shift, " needs to define sound!"
  } );

sub default_colour {
    return 'unknown';
}

sub speak {
  my $self = shift;
  print $self->name, ' goes ', $self->sound, "\n";
}

__PACKAGE__->meta->make_immutable;

1;
