#!/usr/bin/env raku

use My::MTD;

my $dir = @*ARGS[0] // "../code/results/results_2020_02_01";
my $mtd = My::MTD.new( :dir($dir ) );

for $mtd.final-pop.keys -> $f {
    my @values;
    for $mtd.final-pop{$f}[] -> @c {
	say @c;
	for @c[1][].kv -> $k, $v {
	    @values[$k].push: $v
	}
    }
    say $f, @values;

}
