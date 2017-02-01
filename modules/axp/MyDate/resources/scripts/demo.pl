use 5.012;
use warnings;

use lib './lib'; # TODO: remove this after we learn how to install things

use MyDate;

say MyDate->date;
say MyDate->month;
say MyDate->year;

eval {
	say MyDate->hour;
};
say $@ if $@;

