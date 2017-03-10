package Test::My::List::Util;

use 5.006;
use strict;
use warnings;

use Exporter qw( import );
use vars qw( @EXPORT $VERSION );

use Test::Builder;

=head1 NAME

Test::My::List::Util - Tests with summing powers

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

my $Test = Test::Builder->new();
@EXPORT = qw( sum_ok );

=head1 SYNOPSIS

Test library which can sum up things

    use Test::My::List::Util;

	my $sum = sum( 2, 2 );
    sum_ok( $sum, 4, 'The sums match' );
    ...

=head1 EXPORT

=head1 SUBROUTINES/METHODS

=head2 sum_ok

A test function. First parameter is the test value, next is the sum value,
and then a final optional test description

=cut

sub sum_ok {
	my ( $actual, $expected, $desc ) = @_;
	$desc //= 'Testing summed values';

	if ( $actual == $expected ) {
		$Test->ok( 1 , $desc );
	}
	else {
		$Test->diag( "Expected: $expected, Actual $actual." );
		$Test->ok( 0 , $desc );
	}
}

=head1 AUTHOR

Alex P, C<< <alexp at fake.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-test-my-list-util at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Test-My-List-Util>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Test::My::List::Util

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Test-My-List-Util>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Test-My-List-Util>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Test-My-List-Util>

=item * Search CPAN

L<http://search.cpan.org/dist/Test-My-List-Util/>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Alex P.

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

1; # End of Test::My::List::Util
