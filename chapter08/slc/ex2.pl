#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use List::Util qw( reduce );

print { $_->{filehandle} } @{ $_->{lines} } foreach values reduce { $a->{$b->[0]}{filehandle} //= IO::File->new( $b->[0] . '.info', 'w' ); push @{ $a->{$b->[0]}{lines} }, $b->[1]; $a; } {}, map { $_->[0] =~ s/\s+//g; [$_->[0], $_->[1]] } map { [lc((split /:/, $_)[0]), $_] } <>;


# User friendly version
#
# my %hash;
# while (<>) {
#     my $key = $_;
#     $key = lc((split /:/, $key)[0]);
#     $key =~ s/\s+//g;
#     push @{ $hash{$key}{lines} }, $_;
# }
# 
# foreach my $key ( keys %hash ) {
#     $hash{$key}{fh} //= IO::File->new( "$key.info", 'w' );
#     print { $hash{$key}{fh} } @{ $hash{$key}{lines} };
# }
#

