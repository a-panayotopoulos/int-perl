package RaceHorse;
use Moose;
use namespace::autoclean;

extends 'Horse';

use Storable;

use constant FILENAME => 'all_stats.txt';

has 'name'  => ( is => 'rw', required => 1 );
has $_ => (is => 'rw', default => 0)
  foreach qw(wins places shows losses);
has all_time_stats => (is => 'rw');

sub BUILD {
    my $self = shift;
    $self->load_stats();
}

sub won    { my $self = shift; $self->wins($self->wins + 1) }
sub placed { my $self = shift; $self->places($self->places + 1) }
sub showed { my $self = shift; $self->shows($self->shows + 1) }
sub lost   { my $self = shift; $self->losses($self->losses + 1) }

sub standings {
  my $self = shift;
  $self->load_stats();
  join ', ', map { ( $self->$_ + $self->all_time_stats()->{$_} ) . " $_" } qw(wins places shows losses);
}

sub load_stats {
    my $self = shift;
    
    if ( !-e FILENAME ) {
      store( {}, FILENAME );
    }
    
    my $all_statistics = retrieve( FILENAME );
    $all_statistics->{$self->name()} //= {};
    my $horse_stats = $all_statistics->{$self->name()};
    $horse_stats->{$_} //= 0 for qw(wins places shows losses);
    $self->all_time_stats( $horse_stats );
}

sub all_time_standings {
    my $all_statistics = retrieve( FILENAME );
    
    my @ordered = sort { $b->{points} <=> $a->{points} } map { { name => $_, details => $all_statistics->{$_} , points => ( $all_statistics->{$_}{wins} * 3 ) + ( $all_statistics->{$_}{places} * 2 ) + $all_statistics->{$_}{shows} } } keys %$all_statistics;
    print "All time standings:\n";
    printf( "%-20s %s wins, %s places, %s shows, %s losses\n", $_->{name}, $_->{details}{wins}, $_->{details}{places}, $_->{details}{shows}, $_->{details}{losses} ) foreach ( @ordered );
}

sub DEMOLISH {
    my $self = shift;
    my $all_statistics = retrieve( FILENAME );
    $all_statistics->{$self->name}->{$_} += $self->$_ for qw(wins places shows losses);
    store( $all_statistics, FILENAME );
}

__PACKAGE__->meta->make_immutable;

1;