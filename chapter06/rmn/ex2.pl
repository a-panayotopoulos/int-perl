use 5.014;
use strict;
use warnings;
use autodie;
use JSON qw( to_json from_json );

my $cache_file = 'total_byte_cache.json';

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

store( \%total_bytes, $cache_file );

sub retrieve {
  my ( $file ) = @_;
  my $fh;
  open $fh, "<", $file;

  my $json = '';
  $json .= $_ foreach <$fh>;

  close $fh;

  return from_json( $json );
}

sub store {
  my ( $data, $file ) = @_;

  my $fh;
  open $fh, ">", $file;

  say { $fh } to_json( $data, { pretty => 1 } );

  close $fh;
}

