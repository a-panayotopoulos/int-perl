package Animal;

use 5.006;
use strict;
use warnings;
use parent qw( LivingCreature );
use Carp qw( croak );

=head1 NAME

Animal - Represent an abstract animal

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Don't use this class directly; instead instantiate subclasses of it.

=head1 EXPORT

=head1 SUBROUTINES/METHODS

=head2 named

Construct a new Animal, with the given name

=cut

sub named {
	ref ( my $class = shift ) and croak "Static constructor used as instance call";
	my $name = shift or croak "Need to provide a name";
	my $self = { Name => $name, Colour => $class->default_colour };
	bless $self, $class;
	return $self;
}

=head2 name

Get or set the Animal's name

=cut

sub name {
	ref ( my $self = shift ) or croak "Instance variable needed";
	if ( @_ ) {
		$self->{ Name } = shift;
		return $self;
	}
	else {
		return $self->{ Name };
	}
}

=head2 colour

Get or set the Animal's colour

=cut

sub colour {
	my $either = shift;
	
	if ( @_ ) {
		ref ( $either ) or croak "Instance variable needed";
		$either->{ Colour } = shift;
		return $either;
	}
	else {
		return ref ( $either ) ? $either->{ Colour } : $either->default_colour();
	}
}

=head2 default_colour

The default colour for this type of animal.

=cut

sub default_colour {
	croak 'You have to define default_colour() in a subclass';
}

=head2 speak

=cut

sub speak {
	my $either = shift;
	ref ( $either ) ? print $either->name . " goes " . $either->sound . "!\n" : $either->SUPER::speak();
}

=head1 AUTHOR

Alex Panayotopoulos, C<< <alex.p at fake.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-animal at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Animal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Animal

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Animal>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Animal>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Animal>

=item * Search CPAN

L<http://search.cpan.org/dist/Animal/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2016 Alex Panayotopoulos.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Animal
