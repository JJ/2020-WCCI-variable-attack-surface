#!/usr/bin/env raku

use My::MTD;

my $dir = @*ARGS[0] // "../code/results/results_2020_02_01";
my $mtd = My::MTD.new( :dir($dir ) );

say "File, Distance";
for $mtd.final-pop.keys -> $f {
    say $f, ", ", $_ for $mtd.mutual-distances( $mtd.final-pop{$f} );
}
