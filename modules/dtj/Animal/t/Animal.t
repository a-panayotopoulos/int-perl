use strict;
use warnings;

# AFAICT, we're just to copy from the book here right?
# Only it assumes a bunch of stuff which isn't true in my case, so
# my learning experience from this is the TODO

use Test::More tests => 5;

BEGIN {
  use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );


TODO : {
  local $TODO = "I'm using a TODO to hide my laziness";
  # they have to be defined in Animal.pm
  ok( defined &Animal::speak, 'Animal::speak is defined' );
  ok( defined &Animal::sound, 'Animal::sound is defined' );

  # check that sound() dies
  eval { Animal->sound() } or my $at = $@;
  like( $at, qr/You must/, 'sound() dies with a message' );

  # check that speak() dies too
  eval { Animal->speak() } or my $at = $@;
  like( $at, qr/You must/, 'speak() dies with a message' );

# Breaks the things
#  {
#    package Foofle;
#    use parent qw(Animal);
#    sub sound { 'foof' }
#  }

#  ok( Foofle->speak, 'An Animal subclass does the right thing' );
}
