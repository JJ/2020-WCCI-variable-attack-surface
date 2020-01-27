#!/usr/bin/env perl6

use v6;

constant $prefix = "results_";

my @files = dir( ".", test => { /^^$prefix/ } );

for @files -> $f {
    my @initial-pop = $f.slurp.split( / "inicial:" \s+ | \s+ "Población final" /);
    if !@initial-pop[1] {
        say "$f is empty";
        exit(1);
    }
    say ( @initial-pop[1] ~~ m:g/"("(\d+)/ ).map( *[0].Int ).join("\n");
}
