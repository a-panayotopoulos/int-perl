package Racer;

use 5.006;
use strict;
use warnings;

use Carp qw( croak );
use File::Slurp qw ( read_file write_file );
use JSON;
use Moose::Role;
use Moose::Meta::Attribute::Native::Trait::Counter;
use namespace::autoclean;

=head1 NAME

Racer - A generic thing that can generically race

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Have you seen my fabulous racing snails? I use ladybirds as jockeys.

=head1 SUBROUTINES/METHODS

=head2 wins

Number of wins

=head2 won

Racer won a race! :)

=cut

has 'wins' => (
	traits => ['Counter'],
	is => 'ro',
	isa => 'Int',
	default => 0,
	handles => { won => 'inc' } );

=head2 places

Number of places

=head2 placed

Racer placed in a race! :]

=cut

has 'places' => (
	traits => ['Counter'],
	is => 'ro',
	isa => 'Int',
	default => 0,
	handles => { placed => 'inc' } );

=head2 shows

Number of shows

=head2 showed

Racer showed in a race. :|

=cut

has 'shows' => (
	traits => ['Counter'],
	is => 'ro',
	isa => 'Int',
	default => 0,
	handles => { showed => 'inc' } );

=head2 losses

Number of losses

=head2 lost

Racer lost a race. :(

=cut

has 'losses' => (
	traits => ['Counter'],
	is => 'ro',
	isa => 'Int',
	default => 0,
	handles => { lost => 'inc' } );

=head2 standings

Show some standings for this racer

=cut

sub standings {
	my $self = shift;
	return join ', ', map "$self->{$_} $_", qw( wins places shows losses );
}

=head2 tie

Tie the racer's standings to a particular file

=cut

sub tie {
	my $self = shift;
	my $stfile = shift or croak "Standings file needed";

	if ( $self->{wins} || $self->{places} || $self->{shows} || $self->{losses} ) {
		croak "Can't tie; standings already altered";
	}

	if ( -e $stfile ) {
		my $data = from_json read_file $stfile;
		$self->{$_} = $data->{$_} foreach qw( wins places shows losses );
	}

	$self->{stfile} = $stfile;
	return $self;
}

sub DESTROY {
	ref ( my $self = shift ) or croak "Instance variable needed";
	$self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );

	if ( $self->{stfile} ) {
		my %data = map { $_ => $self->{$_} } qw( wins places shows losses );
		write_file $self->{stfile}, to_json \%data;
	}

	return 1;
}

before [ qw( wins won places placed shows showed losses lost standings tie ) ]
	=> $LivingCreature::__instance_check;

=head1 AUTHOR

Alex Panayotopoulos, C<< <alex.p at fake.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-animal at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Animal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Racer

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

1; # End of Racer
