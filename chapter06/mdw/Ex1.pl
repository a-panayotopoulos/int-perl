#!/usr/bin/perl

use strict;
use warnings;
use Storable;

## GET OLD TRAFFIC FILE
my $file = 'file';
store {}, $file unless -r $file;
my $traffic_ref = retrieve($file);
my %traffic = %$traffic_ref;

foreach ( <> ){
	my $imput = $_;
	if ( $imput =~ /#/ ) {
		next;
	}
	my @line = split(/\t/, $imput );
	$traffic{$line[0]}{$line[1]} += $line[2];
}

my %totals;
my @senders = keys %traffic;

foreach my $sender ( @senders ) {
	$totals{$sender} =  size_sender( $sender );
}

@senders = sort { $totals{$b} <=> $totals{$a} } @senders;

my $length = @senders - 1;

foreach my $i ( 0..$length){
	print "$senders[$i]\n";
	#do recivers
	my $reciver_ref = $traffic{$senders[$i]};
	my @recivers = keys %$reciver_ref;
	@recivers = sort { $traffic{$senders[$i]}{$b} <=> $traffic{$senders[$i]}{$a} } @recivers;
	my $reciver_length  = @recivers - 1;
	foreach my $y ( 0..$reciver_length){
		print "\t$recivers[$y] $traffic{$senders[$i]}{$recivers[$y]}\n";
	}
}

## STORE TRAFFIC FILE
store \%traffic, $file;

sub size_sender {
	my $sender = shift;
	my $size;
	foreach my $reciver ( keys %{$traffic{$sender}} ) {
        	$size += $traffic{$sender}{$reciver};
	}
	return $size;
}


