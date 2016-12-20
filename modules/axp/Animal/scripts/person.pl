use 5.012;
use warnings;

use lib './lib'; # TODO: remove this after we learn how to install things

use Cow;
use Mouse;

# This shows that both Cow and Mouse can't actually say things, they just make noises
Cow->speak;
Cow->speak( "The grass over the other side of that fence looks greener. " .
	"Wait, shit, I forgot I was colourblind." );

Mouse->speak;
Mouse->speak( "Emmenthal's overrated, really. Have you tried a nice Fontina?" );
