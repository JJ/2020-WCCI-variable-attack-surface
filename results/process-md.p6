#!/usr/bin/env raku

use Text::CSV;

my @md-data =  csv(in => "mutual-distances-all.csv");

my %md;
for @md-data -> @l {
    %md{@l[3]}{@l[1]}.push: @l[2];
}

say "Experiment, Population, Entropy, Avg.Distance";
for %md.keys -> $e {
    for %md{$e}.keys -> $f {
	my %freqs;
	my @distances = %md{$e}{$f}[];
	%freqs{$_}++ for @distances;
	my $elems =  @distances.elems;
	my @n-freqs = %freqs.keys.map: { %freqs{$_}/ $elems };
	my $entropy;
	if @n-freqs.elems > 1 {
	    $entropy = [+] @n-freqs.map: { - $_ * log( $_ ) };
	} else {
	    $entropy = 0;
	}
	my $average = ([+] @distances )/@distances.elems;
	my $pop = $f ~~ / "simple_" (\d+ )/;
	say "$e, $pop[0], $entropy, $average";
    }
}
