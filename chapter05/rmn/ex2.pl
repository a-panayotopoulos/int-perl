use 5.014;
use strict;
use warnings;
use autodie;
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

my %total_bytes;
my %sent;

while( <> ) {
  next if m/^#/;
  my ( $src, $dst, $bytes ) = split;
  $total_bytes{$src}{$dst} += $bytes;
  $sent{$src} += $bytes;
}

for my $src ( sort { $sent{$b} <=> $sent{$a} } keys %total_bytes ) {
  say "$src total $sent{$src}";
  for my $dst ( sort { $total_bytes{$src}{$b} <=> $total_bytes{$src}{$a} } keys %{ $total_bytes{$src} } ) {
    say "$src => $dst:",
     " $total_bytes{$src}{$dst} bytes";
  }
  say "";
}
