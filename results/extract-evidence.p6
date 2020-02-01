#!/usr/bin/env raku

my $content = $*ARGFILES.lines.join("\n");

my $alerts = $content ~~ m:g{ "Alert →" \s+ (.+? ) \v \w };

my %evidences;

for $alerts.list -> $alert {
    %evidences{$alert.lines()[2]}++;
}

say %evidences;
