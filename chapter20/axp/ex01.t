#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 0.62 tests => 3;
use Test::File;

use constant {
	WIN_FILE => 'C:\windows\system32\drivers\etc\hosts',
	LINUX_FILE => '/etc/hosts'
};

my $didfiletest = 0;

SKIP: {
	skip 'Not running in Windows', 1 unless "$^O" eq "MSWin32";
	$didfiletest = 1;
	file_exists_ok( WIN_FILE );
}

SKIP: {
	skip 'Not running in Linux', 1 unless "$^O" eq "linux";
	$didfiletest = 1;
	file_exists_ok( LINUX_FILE );
}

ok( $didfiletest, "File testing performed (OS = $^O)" );
