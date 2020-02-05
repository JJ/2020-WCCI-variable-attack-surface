#!/usr/bin/env raku

use My::MTD;

my $mtd = My::MTD.new( :dir("../code/results/results_2020_02_01") );

say "File, Distance";
for $mtd.final-pop.keys -> $f {
    say $f, ", ", $_ for $mtd.mutual-distances( $mtd.final-pop{$f} );
}
