#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

package Island 0.11;

use Exporter qw(import);

our @EXPORT = qw( number_to_day_name number_to_month_name );

our %EXPORT_TAGS = (
  all       => [ @EXPORT, ],
);

#Translations
our @day = qw(ark dip wap sen pop sep kir);
our @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

#This method turns the number of the day into its name
sub number_to_day_name { 
	my ( $num ) = @_;
	if ( $num && ( $num >= 0 ) && ( $num < 7 ) ){
		return $day[$num]; 
	} else {
		print "You idiot use this program correctly\n";
	}
}

#This method turns the number of the month into its name
sub number_to_month_name {
        my ( $num ) = @_;
        if ( $num && ( $num >= 0 ) && ( $num < 12 ) ){
                return $month[$num];
        } else {
                print "You idiot use this program correctly\n";
        }
}

1;
