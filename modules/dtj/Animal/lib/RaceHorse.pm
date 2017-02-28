package RaceHorse;
use parent qw(Horse);

use strict;
use warnings;

use JSON;
use File::Slurp qw( read_file write_file );
use File::Path qw( make_path );
use constant STORAGE => 'racehorses/';

sub named {
  my $self = shift->SUPER::named(@_);

  if ( -e $self->get_storage_name() ) {
    my $json = from_json( read_file( $self->get_storage_name() ) );
    $self->{$_} = $json->{$_} for qw(wins places shows losses);
  } else  {
    $self->{$_} = 0 for qw(wins places shows losses);
  }

  $self;
}

sub won { shift->{wins}++; }
sub placed { shift->{places}++; }
sub showed { shift->{shows}++; }
sub lost { shift->{losses}++; }
sub standings {
  my $self = shift;
  join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

sub DESTROY {
  my $self = shift;

  if ( ! -d STORAGE ) {
    make_path( STORAGE );
  }

  my %to_store = (
    wins => $self->{wins},
    places => $self->{places},
    shows => $self->{shows},
    losses => $self->{losses},
  );

  write_file( $self->get_storage_name(), to_json(\%to_store ) );
  $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
}

sub get_storage_name {
  my $self = shift;

  return STORAGE . $self->name . ".json";
}

1;
