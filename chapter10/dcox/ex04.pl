#!/usr/bin/perl
use strict;
use warnings;

sub data_for_path {
  my $path = shift;
  if ( -f $path or -l $path ) { # files or symbolic links
    return undef;
  }
  if ( -d $path ) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name ( @names ) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path( "$path/$name" );
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}

sub dump_data_for_path {
  my $path = shift;
  my $data = shift;
  my $depth = shift || 0;

  print '  ' x $depth, $path;

  if ( not defined $data ) { # plain file
    print "\n";
    return;
  }

  if ( keys %$data ) {
    print ", with contents:\n";
    foreach ( sort keys %$data ) {
      dump_data_for_path( $_, $data->{$_}, $depth + 1 );
    }
  }
  else {
    print ", an empty directory\n";
  }
}

dump_data_for_path( '.', data_for_path( '.' ) );
