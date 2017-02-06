use 5.014;
use strict;
use warnings;
use autodie;
use Storable qw( retrieve nstore );

my $cache_file = 'total_byte_cache.dat';

my %total_bytes;

%total_bytes = %{ retrieve( $cache_file ) } if -e $cache_file;


while( <> ) {
  next if m/^#/;
  my ( $src, $dst, $bytes ) = split;
  $total_bytes{$src}{$dst} += $bytes;
}

for my $src ( sort keys %total_bytes ) {
  say $src;
  for my $dst ( sort keys %{ $total_bytes{$src} } ) {
    say "\t$dst\t$total_bytes{$src}{$dst}";
  }
}

nstore( \%total_bytes, $cache_file );
