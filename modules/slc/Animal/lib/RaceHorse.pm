package RaceHorse;

use parent qw(Horse);

use Storable;

use constant FILENAME => 'all_stats.txt';

## extend parent constructor:
sub named {
  my $self = shift->SUPER::named( @_ );
  $self->{stat_name} = $_[0] // 'Unknown Racehorse';
  
  $self->load_stats();
  
  $self->{all_time_stats}->{$_} //= 0 for qw(wins places shows losses);
  $self->{$_} = 0 for qw(wins places shows losses);
  $self;
}

sub won { shift->{wins}++; }

sub placed { shift->{places}++; }

sub showed { shift->{shows}++; }

sub lost { shift->{losses}++; }

sub standings {
  my $self = shift;
  $self->load_stats();
  join ', ', map { ( $self->{$_} + $self->{all_time_stats}->{$_} ) . " $_" } qw(wins places shows losses);
}

sub load_stats {
    my $self = shift;
    
    if ( !-e FILENAME ) {
      store( {}, FILENAME );
    }
    
    my $all_statistics = retrieve( FILENAME );
    $all_statistics->{$self->{stat_name}} //= {};
    $self->{all_time_stats} = $all_statistics->{$self->{stat_name}};
}

sub all_time_standings {
    my $all_statistics = retrieve( FILENAME );
    
    my @ordered = sort { $b->{points} <=> $a->{points} } map { { name => $_, details => $all_statistics->{$_} , points => ( $all_statistics->{$_}{wins} * 3 ) + ( $all_statistics->{$_}{places} * 2 ) + $all_statistics->{$_}{shows} } } keys %$all_statistics;
    print "All time standings:\n";
    printf( "%-20s %s wins, %s places, %s shows, %s losses\n", $_->{name}, $_->{details}{wins}, $_->{details}{places}, $_->{details}{shows}, $_->{details}{losses} ) foreach ( @ordered );
}

sub DESTROY {
    my $self = shift;
    my $all_statistics = retrieve( FILENAME );
    $all_statistics->{$self->{stat_name}}->{$_} += $self->{$_} for qw(wins places shows losses);
    store( $all_statistics, FILENAME );
}



1;