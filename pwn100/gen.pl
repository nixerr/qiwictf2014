#!/usr/bin/perl

use strict;

open FILE, "<te";
open WR, ">te.bad";

my $old = "\x00";
my $count = 0;
while (sysread(FILE, my $data, 1)) {
	if (	($count & 0x000000ff) == 0x0a ||
		($count & 0x000000ff) == 0x20 ||
		($count & 0x000000ff) == 0x00 )
	{
		if ($old == "\x00")
		{
			syswrite WR, "\xff";
		}
		else
		{
			syswrite WR, $data;
		}
	}
	else
	{
		syswrite WR, $data;
	}
	$old = $data;
	$count++;
}
