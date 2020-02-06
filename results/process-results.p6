#!/usr/bin/env perl6

use v6;

constant $prefix = "results_";

my @files = dir( ".", test => { /^^$prefix/ } );

say "Population, Final Best, Initial Best, Copies, Final Avg, Initial Avg";
for @files.sort -> $f {
    my $match = ($f ~~ /$<juice> = ["juice"?] "_" $<population> = [\d+] "_" $<crossover> = [\d] "_" $<mutation> = [\w+] "_" $<rank> = [\d+] / );
    my ($juice, $population, $crossover, $mutation) =
        ($<juice>, $<population>, $<crossover>, $<mutation>); # save before match
    my @final-pop = $f.slurp.split( / "final:" \s+ | \s+ "Elapsed" /);
    #    say @final-pop[1];
    if !@final-pop[1] {
        note "$f is empty";
        next;
    }
    my @fitnesses = ( @final-pop[1] ~~ m:g/"("(\d+)/ ).map( *[0].Int );
    my @initial-pop = @final-pop[0].split( / "inicial:" \s+ | \s+ "Población f" /);
    my @initial-fitnesses = ( @initial-pop[1] ~~ m:g/"("(\d+)/ ).map( *[0].Int );
    my $best = @fitnesses.sort.first;
    my @best = @fitnesses.grep: * == $best;
    say  ~$population, ", ",  $best, ", ", @initial-fitnesses.sort.first, ", ",
    @best.elems/@fitnesses.elems, ", ", 
        @fitnesses.sum/ @fitnesses.elems , ", " ,  @initial-fitnesses.sum / @initial-fitnesses.elems;

}
