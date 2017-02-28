package RaceHorse;

use 5.006;
use strict;
use warnings;
use Storable;
use JSON;
use File::Slurp qw( read_file write_file );

use parent qw(Horse);

sub named {
  my $self = shift->SUPER::named(@_);
  my $stableNumber = "stables/" . $self->name;
  if ( -e $stableNumber ){
    my $standings = from_json( read_file( "stables/" . $self->name ) );
    $self->{$_} = $standings->{$_} for qw(wins places shows losses);
  } else {
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
  print '[', $self->name, " has died.]\n";
  my %standings = (
    wins => $self->{wins},
    places => $self->{places},
    shows => $self->{shows},
    losses => $self->{losses},
  );
  write_file(  "stables/" . $self->name, to_json(\%standings ) );
}





1;
