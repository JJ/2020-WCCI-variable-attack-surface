use MONKEY-SEE-NO-EVAL;

unit class My::MTD;

constant $prefix = "results_";
has $.dir;
has @.files;
has @.fitnesses;
has %.final-pop;
has %.initial-pop;

submethod TWEAK() {
    @!files = dir( $!dir, test => { /^^$prefix/ } );
    for @!files -> $f {
	say $f;
	my $key = ($f ~~ /"results_" (\w+) ".txt"/);
	my @populations = ( $f.IO.slurp ~~ m:g{ ("[(" \d+ .+? "])]") } );
	my @initial-pop;
	EVAL "\@initial-pop = " ~ @populations[*-2];
	%!initial-pop{$key} = @initial-pop;
	my @final-pop;
	EVAL "\@final-pop = " ~ @populations[*-1];
	%!final-pop{$key} = @final-pop;
    }
}

method mutual-distances( @population ) {
    my @chromosomes-only = @population.map: *[1];
    my @distances;
    for @chromosomes-only.keys -> $i {
        for @chromosomes-only[$i+1..*].keys -> $j {
            @distances.append: [+] ( @chromosomes-only[$i][] Z- @chromosomes-only[$j][] ).map: *.abs;
        }
    }
    return @distances;
}
