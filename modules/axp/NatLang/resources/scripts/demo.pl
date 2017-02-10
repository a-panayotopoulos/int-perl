use 5.012;
use warnings;

use lib './lib'; # TODO: remove this after we learn how to install things

require NatLang;

use constant {
        LOCALTIME_EPOCH => 1900,
        NATIVE_EPOCH => -3024 # Native year numbering begins at 3024 B.C.E.
};

my ( $date, $month, $year, $dow ) = (localtime)[3..6];
$year += LOCALTIME_EPOCH - NATIVE_EPOCH;

printf "Gazad meh %so %d %s, %d\n", NatLang::number_to_day_name( $dow ), $date, NatLang::number_to_month_name( $month ), $year;
