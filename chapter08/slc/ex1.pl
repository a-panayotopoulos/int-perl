#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use IO::TEE;

# Autoflush for Windows!
$|=1;

my @output_fhs;
my @scalar_refs;

my %options = (
    'scalar' => {
        question => 'Output to scalar?',
        create_fh => sub {
            open my $scalar_fh, '>>', \ my $string;
            push @scalar_refs, \$string;
            return $scalar_fh;
        },
    },
    'file' => {
        question => 'Output to file?',
        create_fh => sub {
            return IO::File->new( 'date.txt', 'w' );
        },
    },
);

foreach my $opt ( values %options ) {
    my $answer;
    while ( !defined $answer || $answer !~ /^[yn]$/i ) {
        print $opt->{question} . ' ';
        $answer = <STDIN>;
        chomp( $answer );
    }
    if ( $answer =~ /^y$/i ) {
        push @output_fhs, $opt->{create_fh}->();
    }
}

if ( !scalar @output_fhs ) {
    die "Don't be stupid, you should select at least one output.\n"
}

my $tee_fh = IO::Tee->new( @output_fhs );

print $tee_fh POSIX::strftime( "%d/%m/%Y (%A)", localtime);

foreach ( @scalar_refs ) {
    print $$_, "\n";
}