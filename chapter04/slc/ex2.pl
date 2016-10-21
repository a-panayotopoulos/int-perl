#!/usr/bin/perl

use strict;
use warnings;

my @gilligan  = qw();
my @skipper   = qw( hat jacket sunscreen);
my @professor = qw( badge preserver sunscreen water_bottle );
my @sean      = qw( preserver sunscreen water_bottle jacket );

my %all = (
  Gilligan  => \@gilligan,
  Skipper   => \@skipper,
  Professor => \@professor,
  Sean      => \@sean,
);

check_items_for_all(\%all);

sub check_items_for_all  {
    my ( $all ) = @_;
    check_required_items( $_, $all->{$_} ) foreach ( keys %$all );
}

sub check_required_items {
  my $who   = shift;
  my $items = shift;

  my %whose_items = map { $_, 1 } @$items;

  my @required = qw(preserver sunscreen water_bottle jacket);
  my @missing = (  );

  for my $item (@required) {
    unless ( $whose_items{$item} ) { # not found in list?
      print "$who is missing $item.\n";
      push @missing, $item;
    }
  }

  if (@missing) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
  }
}