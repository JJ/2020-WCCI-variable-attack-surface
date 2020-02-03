use MONKEY-SEE-NO-EVAL;

unit class My::MTD;

constant $prefix = "results_";
has $.dir;
has @.files;
has @.fitnesses;
has @.final-pop;
has @.initial-pop;

submethod TWEAK() {
    @!files = dir( $!dir, test => { /^^$prefix/ } );
    for @!files -> $f {
	my @populations = ( $f.IO.slurp ~~ m:g{ ("[(" \d+ .+? "])]") } );
	EVAL "\@!initial-pop = " ~ @populations[*-2];
	my @final-population;
	EVAL "\@!final-pop = " ~ @populations[*-1];

    }
}

