package My::List::Util;

use 5.006;
use strict;
use warnings;
use Scalar::Util qw( looks_like_number );

=head1 NAME

My::List::Util - A buggier reimplementation of things that have been done millions of times before

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Does boring list stuff

=head1 SUBROUTINES/METHODS

=head2 sum

Returns a sum of a list.
=cut

sub sum {
  my ( @input ) = @_;

  if ( !scalar @input ) {
    die "Input was empty";
  }

  my $sum;
  foreach my $element ( @input ) {
    if ( !looks_like_number( $element ) ) {
      die "Invalid input: $element";
    }
    $sum += $element;
  }

  return $sum;
}

=head2 shuffle
Mix things up a little bit
=cut

sub shuffle {
  my ( @input ) = @_;

  if ( !scalar @input ) {
    die "Input was empty";
  }

  my $size = @input;
  my @output;
  while ( @input ) {
    my $i = int( rand() * @input );
    push @output, $input[$i];

    # I had delete and it was leaving undefs
    splice @input, $i, 1;
  }

  return @output;
}

=head1 AUTHOR

Daniel jones, C<< <dtj at someplace.com> >>

=head1 BUGS

Included free of charge


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc My::List::Util

=head1 LICENSE AND COPYRIGHT

Copyright 2017 Daniel jones.

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

1; # End of My::List::Util
