use 5.012;
use warnings;

use lib './lib'; # TODO: remove this after we learn how to install things

use Cow;
use Horse;
use Sheep;
use Mouse;

my %speakers = (
	'cow' => sub { Cow->speak },
	'horse' => sub { Horse->speak },
	'sheep' => sub { Sheep->speak },
	'mouse' => sub { Mouse->speak } );

printf( "Please populate the barnyard with animals of type <%s>; %s to finish\n",
	join( ', ', sort keys %speakers ),
	$^O eq "MSWin32" ? "<Ctrl>+Z" : "<Ctrl>+D" );

chomp( my @barnyard = <> );

foreach my $animal ( @barnyard ) {
	next unless $animal;
	my $s = $speakers{lc $animal};
	$s ? &$s : warn "Not a recognised animal $animal\n";
}