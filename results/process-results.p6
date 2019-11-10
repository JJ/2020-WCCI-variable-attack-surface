#!/usr/bin/env perl6

use v6;

my $prefix = $*ARGS[0] || "results_";

my @files = dir( ".", test => { /^^$prefix/ } );

for @files -> $f {
    say $f;
    my $match = ($f ~~ /$<juice> = ["juice"?] "_" $<population> = [\d+] "_" $<crossover> = [\d] "_" $<mutation> = [\w+] "_" $<rank> = [\d+] / );
    my ($juice, $population, $crossover, $mutation) =
        ($<juice>, $<population>, $<crossover>, $<mutation>); # save before match
    my @final-pop = $f.slurp.split( / "final:" \s+ | \s+ "Elapsed" /);
#    say @final-pop[1];
    my @fitnesses = ( @final-pop[1] ~~ m:g/"("(\d+)/ ).map( *[0].Int );
    say $juice??"Juice Shop"!!"Static", ", $population, $crossover, $mutation, ",  @fitnesses.sort.first;
    
}
