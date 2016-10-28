use 5.014;
use strict;
use warnings;
use autodie;
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

my %total_bytes;

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
