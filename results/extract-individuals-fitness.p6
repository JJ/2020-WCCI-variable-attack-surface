#!/usr/bin/env perl6

use My::MTD;

my $mtd-analysis = My::MTD.new( :dir("../code/results/results_2020_02_05/") );
for $mtd-analysis.meta.keys -> $f {
    my $individuals = $mtd-analysis.meta{$f}[1];
    for $mtd-analysis.vulnerabilities{$f}.kv -> $g, %v {
        say "$individuals, $g, %v<Low>, ", %v<Medium> // 0;
    }
}

