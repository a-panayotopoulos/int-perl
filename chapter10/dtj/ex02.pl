#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw( cmpthese );

my $not_actually_my_home_dir = '*';

# My solution appears to be slower than the books solution.
# Running on a Raspberry Pi 3
# 
# Output on chapter10/dtj directory:
#                      Rate      dtj_solution int_perl_solution
# dtj_solution       9934/s                --              -49%
# int_perl_solution 19523/s               97%                --
#
# Output on /bin directory:
# 
#                      Rate      dtj_solution int_perl_solution
# dtj_solution      39746/s                --              -48%
# int_perl_solution 77128/s               94%                --
#
# EDIT: This seemed strange enough to me that I thought I'd cheat and 
# look at what others have done. AXP has a comment that says that
# assigning to an array changes the runtime so let's take a look at that.
#
# Output on chapter10/dtj directory:
#                             Rate dtj_solution_assign dtj_solution int_perl_solution_assign int_perl_solution
# dtj_solution_assign       9326/s                  --          -6%                     -15%              -52%
# dtj_solution              9935/s                  7%           --                     -10%              -49%
# int_perl_solution_assign 10981/s                 18%          11%                       --              -44%
# int_perl_solution        19602/s                110%          97%                      79%                --
#
# Output on /bin directory:
#                              Rate dtj_solution_assign dtj_solution int_perl_solution_assign int_perl_solution
# dtj_solution_assign      34938/s                  --         -13%                     -45%              -55%
# dtj_solution             39965/s                 14%           --                     -37%              -49%
# int_perl_solution_assign 63075/s                 81%          58%                       --              -20%
# int_perl_solution        78495/s                125%          96%                      24%                --
#
# As that showed similar I stole axps solutions to run them myself
#(I changed the 5 to -5 though because it moaned about too few iterations) and that gave me this for the 
# chapter10/dtj directory:
#
# Benchmark: running naive, schwartzian for at least 5 CPU seconds...
#     naive:  5 wallclock secs ( 2.30 usr +  2.87 sys =  5.17 CPU) @ 9809.67/s (n=50716)
# schwartzian:  5 wallclock secs ( 3.38 usr +  1.89 sys =  5.27 CPU) @ 8112.71/s (n=42754)
#
# Odd.
 

cmpthese( -10, {
    int_perl_solution => sub { sort { -s $a <=> -s $b } glob $not_actually_my_home_dir },
    dtj_solution => sub { 
        map $_->{name},
        sort { $b->{size} <=> $a->{size} }
        map { name => $_, size => -s $_ },
        glob $not_actually_my_home_dir;
    },
    # Post cheating solutions
    int_perl_solution_assign => sub { my @files = sort { -s $a <=> -s $b } glob $not_actually_my_home_dir },
    dtj_solution_assign => sub { 
        my @files = 
            map $_->{name},
            sort { $b->{size} <=> $a->{size} }
            map { name => $_, size => -s $_ },
            glob $not_actually_my_home_dir;
    },
} );

