package Mouse;

use Moose;
use namespace::autoclean;

extends 'Animal';

has 'sound' => ( is => 'ro', default => 'squeak' );

after 'speak' => sub {
  print "[but you can barely hear it!]\n";
};

__PACKAGE__->meta->make_immutable;

1;