#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;

my $p = "C:/Data/int-perl/chapter10";
print "Printing what's in $p:\n";
print dump_data_for_path($p, data_for_path($p));

sub dump_data_for_path {
  my ( $path, $data, $indentation ) = @_;
  $indentation //= 0;

  my $output = basename( $path );
  if ( defined $data ) {
    if ( scalar keys %$data ) {
      $output .= ", with contents:";
    }
    else {
      $output .= ", an empty directory";
    }
  }
  
  printf( "%s%s\n", "  " x $indentation, $output );

  if ( defined $data ) {
    foreach (sort keys %$data) {
      dump_data_for_path("$path/$_", $data->{$_}, $indentation + 1);
    }
  }
}

# EXISTING STUFF

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) {        # files or symbolic links
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path/$name");
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}