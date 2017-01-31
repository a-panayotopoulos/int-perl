#!/usr/bin/perl

use strict;
use warnings;
use File::Slurp;
use Regexp::Assemble;

my @lines = read_file( $ARGV[0] );
my $patterns = Regexp::Assemble->new;

foreach my $line ( @lines ) {
    chomp $line; # first ex didn't seem to need this
    my $pattern = eval { qr/$line/ };
    if ( $pattern ) {
        $patterns->add( $pattern );
    } else {
        print "Skipping bad pattern '$pattern'";
    }
}

# Removed my error handling - couldn't find any obvious way to do it other than checking that at some point we made it into the if $pattern block above. 
# On the empty files input, the assembled pattern was: '(?^:^\b)'

print "Patterns loaded, enter some input to match against.\n";

my $pattern = $patterns->re; # I wanted to just use the match method but it didn't like me.
print "Constructed pattern was: '$pattern'\n";
while ( <STDIN> ) {
    print "Matched on line $.\n" if /$pattern/;
}




