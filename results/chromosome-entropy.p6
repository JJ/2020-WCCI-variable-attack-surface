#!/usr/bin/env raku

use My::MTD;

my $dir = @*ARGS[0] // "../code/results/results_2020_02_01";
my $mtd = My::MTD.new( :dir($dir ) );

for $mtd.final-pop.keys -> $f {
    my @values;
    for $mtd.final-pop{$f}[] -> @c {
	for @c[1][].kv -> $k, $v {
	    @values[$k].push: $v
	}
    }
    my $entropy;
    for @values -> $v {
	my @vs = $v[];
	my %freqs;
	@vs.map: {%freqs{$_}++};
	my $elems =  @vs.elems;
	my @n-freqs = %freqs.keys.map: { %freqs{$_}/ $elems };
	my $this-entropy = [+] @n-freqs.map: { - $_ * log( $_ ) };
	$entropy += $this-entropy;
    }
    say "$f, $entropy";
}
