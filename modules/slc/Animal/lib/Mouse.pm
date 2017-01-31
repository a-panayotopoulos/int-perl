package Mouse;
use parent qw(Animal);

sub sound { 'squeak' }

sub speak {
  my $class = shift;
  $class->SUPER::speak(@_); # tell it where to start
  print "[but you can barely hear it!]\n";
}

1;