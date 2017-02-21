package NatLang;

use 5.006;
use strict;
use warnings;
use Carp qw( croak );
use Exporter qw( import );

=head1 NAME

NatLang - Native language functions

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

our @day_of_week = qw( ark dip wap sen pop sep kir );
our @month_name = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

our @EXPORT_OK = qw( number_to_day_name number_to_month_name );
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

=head1 SYNOPSIS

Native language functions for day and month names.

    use NatLang qw ( :all );

	for ( my $dow = 0; $dow < 7; $dow++ ) {
		say "Day $dow is " . number_to_day_name( $dow );
	}

	for ( my $mon = 0; $mon < 12; $mon++ ) {
		say "Month $mon is " . number_to_month_name( $mon );
	}

=head1 EXPORT

=head1 SUBROUTINES/METHODS

=head2 number_to_day_name

Names for days of week;
	0 = Sunday
	6 = Saturday

=cut

sub number_to_day_name {
	my $num = shift // croak "No day number provided\n";
	croak "Argument '$num' is not numeric\n" unless $num =~ /^-?\d+$/;
	return $day_of_week[$num] // croak sprintf( "Day number %d out of range 0-%d\n", $num, $#day_of_week );
}

=head2 number_to_month_name

Names for months of year;
	0 = January
	11 = December

=cut

sub number_to_month_name {
	my $num = shift // croak "No month number provided\n";
	croak "Argument '$num' is not numeric\n" unless $num =~ /^-?\d+$/;
	return $month_name[$num] // croak sprintf( "Month number %d out of range 0-%d\n", $num, $#month_name );
}

=head1 AUTHOR

Alex Panayotopoulos, C<< <alexp at fake.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-natlang at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NatLang>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc NatLang

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=NatLang>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/NatLang>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/NatLang>

=item * Search CPAN

L<http://search.cpan.org/dist/NatLang/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Alex Panayotopoulos.

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

1; # End of NatLang
