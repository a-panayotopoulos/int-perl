#!/usr/bin/perl

use warnings;
use Data::Dumper;

$y=2;
$z=-1; foreach my $i ( 
  0..13 ){ $p = 1;
	if ( $i == $y || $i ==3 || 
       $i == 6 || $i == 13 ){
	if ( $i == 
     ($y*2)-$z ){
		   $z += 1;
		$y = $i;
}
$p = 0; 
	}
	$love_actually{$i} = $p;
}

ho();ho();ho();said_santa();
$love_actually{9} = 0;$love_actually{10} = 0;
ho();ho();ho();said_santa();
$love_actually{3} = 1;$love_actually{2} = 1;
ho();ho();ho();said_santa();
$love_actually{3} = 0;
$love_actually{2} = 0;
ho();ho();ho();said_santa();
$love_actually{9} = 1;
$love_actually{10} = 1;
ho();ho();ho();said_santa();

sub ho {
foreach my $i ( 0..13 ){
$snow 
  = $love_actually{$i}?"1":"2";
    $snow 
      =~ s/1/X/g;
        $snow =~ s/2/ /g;
print $snow;
  }
    } 
  sub went_rudolph {
    }
    sub said_santa {
      print "\n";
}
    sub scree {
        }
