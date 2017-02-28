package RaceHorse;

use strict;
use warnings;
use Storable;
use feature "say";

use parent qw(Horse);

sub named {
    my $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    my $data_file = "racehorse.data";
    if (-e $data_file) {
        say "$data_file has some previous data";
        my $ref = retrieve $data_file;
        @$self{qw(wins places shows losses)} = @$ref;
    }
    $self;
}

sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY if $self->can('SUPER::DESTROY');
    my $data_file = "racehorse.data";
    say "Lets record the stats to $data_file.. ";
    store [ @$self{qw(wins places shows losses)} ], $data_file;
}

sub won { shift->{wins}++; }

sub placed { shift->{places}++; }

sub showed { shift->{shows}++; }

sub lost { shift->{losses}++; }

sub standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

1;
