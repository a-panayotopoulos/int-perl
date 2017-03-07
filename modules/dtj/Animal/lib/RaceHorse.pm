package RaceHorse;
use parent qw(Horse);

use strict;
use warnings;

use Moose;
use namespace::autoclean;

extends 'Horse';

use JSON;
use File::Slurp qw( read_file write_file );
use File::Path qw( make_path );
use constant STORAGE => 'racehorses/';

has $_ => (is => 'rw', default => 0)
  foreach qw(wins places shows losses);

sub BUILD {
  my $self = shift;

  if ( -e $self->get_storage_name() ) {
    my $json = from_json( read_file( $self->get_storage_name() ) );
    $self->$_( $json->{$_} ) for qw(wins places shows losses);
  }

  $self;
}

sub won    { my $self = shift; $self->wins($self->wins + 1) }
sub placed { my $self = shift; $self->places($self->places + 1) }
sub showed { my $self = shift; $self->shows($self->shows + 1) }
sub lost   { my $self = shift; $self->losses($self->losses + 1) }
sub standings {
  my $self = shift;
  join ', ', map $self->$_ . " $_", qw(wins places shows losses);
}

sub DESTROY {
  my $self = shift;

  if ( ! -d STORAGE ) {
    make_path( STORAGE );
  }

  my %to_store = (
    wins => $self->wins,
    places => $self->places,
    shows => $self->shows,
    losses => $self->losses,
  );

  write_file( $self->get_storage_name(), to_json(\%to_store ) );
  $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
}

sub get_storage_name {
  my $self = shift;

  return STORAGE . $self->name . ".json";
}

1;
