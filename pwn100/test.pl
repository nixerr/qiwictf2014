#!/usr/bin/perl

use strict;

my $hex = "f773e000";

my $hex2 = hex($hex);


if ($hex2 ^ 0x000000ff == 0x0a) {
	$hex2++;
}
my $bin =  pack ("I*", $hex2),"\n";
print unpack ("H*", $bin);

#my $hh = sprintf "%08X\n", $hex2;
#print $hh;
#print pack ("H*", $hex2),"\n";
