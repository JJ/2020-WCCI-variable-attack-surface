#!/usr/bin/env perl6

use v6;

constant $prefix = "results_";
my @time = "time.csv".IO.slurp.lines;

my %time;
@time.pop; # Eliminates last
for @time[1..*] -> $l {
    my @data = $l.split(":");
    say @data;
    my @times = @data[1].split(",");
    %time{@data[0]} = @times[*-1];
}

my @files = dir( ".", test => { /^^$prefix/ } );

say "Web, Population, Crossover, Mutation, Fitness, Copies, Days";
for @files -> $f {
    my $match = ($f ~~ /$<juice> = ["juice"?] "_" $<population> = [\d+] "_" $<crossover> = [\d] "_" $<mutation> = [\w+] "_" $<rank> = [\d+] / );
    my ($juice, $population, $crossover, $mutation) =
        ($<juice>, $<population>, $<crossover>, $<mutation>); # save before match
    my @final-pop = $f.slurp.split( / "final:" \s+ | \s+ "Elapsed" /);
    #    say @final-pop[1];
    if !@final-pop[1] {
        say "$f is empty";
        exit(1);
    }
    my @fitnesses = ( @final-pop[1] ~~ m:g/"("(\d+)/ ).map( *[0].Int );
    my $best = @fitnesses.sort.first;
    my @best = @fitnesses.grep: * == $best;
    say ( $juice ne '' )??"Juice Shop"!!"Static", ", $population, $crossover, $mutation, ",  $best, ", ",  @best.elems/@fitnesses.elems, ", ", %time{$f};
    
}
