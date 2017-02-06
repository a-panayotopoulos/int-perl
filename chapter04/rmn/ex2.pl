use 5.014;
use strict;
use warnings;
use autodie;
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

my $all = {
	Gilligan  => [qw(red_shirt hat lucky_socks water_bottle)],
	Skipper   => [qw(blue_shirt hat jacket preserver sunscreen)],
	Professor => [qw(sunscreen water_bottle slide_rule batteries radio)],
};

check_items_for_all($all);

say "$_ has @{$all->{$_}}" foreach keys %$all;

sub check_items_for_all {
	my ( $peeps ) = @_;

	foreach my $peep ( keys %$peeps ) {
		my %items = map { $_ => 1 } @{$peeps->{$peep}}, qw( jacket preserver sunscreen water_bottle );
		$peeps->{$peep} = [ sort keys %items ]
	}
}
