#!/usr/bin/env raku

# Use with raku obtain-sorted code/results/test-run-14.log, for example.

my $log = $*ARGFILES.slurp;

my $matches = ($log ~~ m:g{ ( \[ \( .+? \) \] ) } );

say "Gen,Rank,Fitness";
for $matches.list.kv[0..*-5] -> $i, $m {
    my $fitness = ($m ~~ m:g{ \( ( \d+ ) "," } );
    my $r=1;
    say $i+1, ", ", $r++, ", $_[0]" for $fitness.list;
}
