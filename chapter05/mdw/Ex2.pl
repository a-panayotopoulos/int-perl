#!/usr/bin/perl

use strict;
use warnings;

my %traffic;

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
	print "Sender " . ($i+1) . " was $senders[$i] they sent ".$totals{$senders[$i]}. " They sent stuff to:\n";
	#do recivers
	my @recivers = keys $traffic{$senders[$i]};
	@recivers = sort { $traffic{$senders[$i]}{$b} <=> $traffic{$senders[$i]}{$a} } @recivers;
	my $reciver_length  = @recivers - 1;
	foreach my $y ( 0..$reciver_length){
		print "\t $recivers[$y] recived $traffic{$senders[$i]}{$recivers[$y]}\n";
	}
}

sub size_sender {
	my $sender = shift;
	my $size;
	foreach my $reciver ( keys %{$traffic{$sender}} ) {
        	$size += $traffic{$sender}{$reciver};
	}
	return $size;
}


