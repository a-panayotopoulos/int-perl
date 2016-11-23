#!/usr/bin/env perl

use 5.014;
use warnings;

package NatLang 1.0;

our @day_of_week = qw( ark dip wap sen pop sep kir );
our @month_name = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

sub number_to_day_name {
	my $num = shift // die "No day number provided\n";
	return $day_of_week[$num] // die sprintf( "Day number %s out of range 0-%s\n", $num, $#day_of_week );
}

sub number_to_month_name {
	my $num = shift // die "No month number provided\n";
	return $month_name[$num] // die sprintf( "Month number %s out of range 0-%s\n", $num, $#month_name );
}