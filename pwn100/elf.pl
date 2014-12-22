#!/usr/bin/perl

use strict;
use Fcntl qw(SEEK_SET SEEK_CUR);

my $file = $ARGV[0] || die "Can i have file, please?\n";
open ELF, "<", $file;
binmode(ELF);

our $STRTAB_off;
our $STRTAB_len; #	= 23770;

our $REL_off; #	= 0x17d4c;
our $REL_len; #	= 10768;

our $JMPREL_off; #	= 0x1a75c;
our $JMPREL_len; #	= 96;

our $SYMTAB_off; #	= 0x73f4;
our $SYMTAB_len; #	= $STRTAB_off-$SYMTAB_off;


our @strtab;
our @reltab;
our @jmpreltab;
our @symtab;
our $e_phoff;
our $e_phentsize;
our $e_phnum;
our $p_offset;
our $p_filesz;

sub find_phdr() {
	my $data;

	sysseek(ELF, 28, SEEK_SET);

	sysread(ELF, $data, 4);
	$e_phoff = unpack("H*", reverse($data));

	sysseek(ELF, 42, SEEK_SET);

	sysread(ELF, $data, 2);
	$e_phentsize = unpack("H*", reverse($data));

	sysread(ELF, $data, 2);
	$e_phnum = unpack("H*", reverse($data));
}

sub find_dynamic() {
	my $data;
	my $p_type;

	sysseek(ELF, hex($e_phoff), SEEK_SET);

	sysread(ELF, $data, 4);
	$p_type = hex(unpack("H*", reverse($data)));
	while ($p_type != 2) {
		sysseek(ELF, hex($e_phentsize)-4, SEEK_CUR);
		sysread(ELF, $data, 4);
		$p_type = hex(unpack("H*", reverse($data)));
	}

	sysread(ELF, $data, 4);
	$p_offset = unpack("H*", reverse($data));

	sysread(ELF, $data, 4);
	sysread(ELF, $data, 4);

	sysread(ELF, $data, 4);
	$p_filesz = unpack("H*", reverse($data));
}

sub parse_dynamic() {
	my $data;
	my ($type, $value);
	my $count = 0;

	sysseek(ELF, hex($p_offset), SEEK_SET);

	while ($count <= hex($p_filesz)) {
		sysread(ELF, $data, 4);
		$type = unpack("H*", reverse($data));

		sysread(ELF, $data, 4);
		$value = unpack("H*", reverse($data));

		$count += 8;

		if ($type eq '00000005') {
			$STRTAB_off = $value;
		} elsif ($type eq '00000006') {
			$SYMTAB_off = $value;
		} elsif ($type eq '0000000a') {
			$STRTAB_len = $value;
		} elsif ($type eq '00000011') {
			$REL_off = $value;
		} elsif ($type eq '00000012') {
			$REL_len = $value;
		} elsif ($type eq '00000017') {
			$JMPREL_off = $value;
		} elsif ($type eq '00000002') {
			$JMPREL_len = $value;
		}
	}

	$SYMTAB_len = sprintf("%08x", hex($STRTAB_off)-hex($SYMTAB_off));
}

sub do_stroff() {
	my $off		= $_[0];

	my $data;
	my $seek_old;
	my $seek_new;
	my $name;

	$seek_old = sysseek(ELF, 0, SEEK_CUR);
	$seek_new = hex($STRTAB_off)+$off;
	sysseek(ELF, $seek_new, SEEK_SET);

	sysread ELF, $data, 1;
	while ($data ne "\x00") {
		$name .= $data;
		sysread ELF, $data, 1;
	}

	sysseek(ELF, $seek_old, SEEK_SET);

	return $name;
}

sub do_symtab() {
	my $off		= $_[0];
	my $size	= $_[1];

	my $data;
	my $st_name;
	my $st_value;
	my $st_size;
	my $st_info;
	my $st_other;
	my $st_shndx;
	my $count = ($size/16)-1;

	sysseek(ELF, $off, SEEK_SET);

	for (my $i = 0; $i <= $count; $i++) {
		my $string;
		my $bind;
		my $type;

		sysread ELF, $data, 4;
		$st_name = unpack("H*", reverse($data));

		sysread ELF, $data, 4;
		$st_value = unpack("H*", reverse($data));

		sysread ELF, $data, 4;
		$st_size = unpack("H*", reverse($data));

		sysread ELF, $data, 1;
		$st_info = unpack("H*", $data);

		$bind = hex($st_info)>>4;
		$type = hex($st_info) & 0xf;

		sysread ELF, $data, 1;
		$st_other = unpack("H*", $data);

		sysread ELF, $data, 2;
		$st_shndx = unpack("H*", reverse($data));
		print "$st_name\n";

		my $name = &do_stroff(hex($st_name));
		$symtab[$i] = $name;
		print "$i:\t$st_name\t$st_value\t$st_size\t$st_info\t$st_shndx\t$name\n"
	}
}

sub do_strtab() {
	my $off		= $_[0];
	my $size	= $_[1];

	my $data;
	my $count;
	my $name;

	sysseek(ELF, $off, SEEK_SET);

	sysread ELF, $data, 1;

	for (my $i = 0; $i <= $size; $i++) {
		sysread ELF, $data, 1;

		if ($data eq "\x00") {
			$strtab[$count] = $name;
			$name = '';
			$count++;
		} else {
			$name .= $data;
		}
	}
}

sub do_reltab() {
	my $off		= $_[0];
	my $size	= $_[1];

	my $data;
	my $count;
	my $name;

	my $r_offset;
	my $r_info;

	sysseek(ELF, $off, SEEK_SET);

	$count = ($size / 8)-1;
	for (my $i = 0; $i <= $count; $i++) {
		sysread ELF, $data, 4;
		$r_offset = unpack ("H*", reverse($data));

		sysread ELF, $data, 4;
		$r_info = unpack("H*", reverse($data));

		my $strndx = (hex($r_info))>>8;
		my $type   = (hex($r_info) & 0xff);
		my $type_str;

		if ($type == 8) {
			$type_str = 'R_386_RELATIVE';
		} elsif ($type == 7) {
			$type_str = 'R_386_JUMP_SLOT';
		} elsif ($type == 6) {
			$type_str = 'R_386_GLOB_DAT';
		} elsif ($type == 5) {
			$type_str = 'R_386_COPY';
		} elsif ($type == 4) {
			$type_str = 'R_386_PLT32';
		} elsif ($type == 3) {
			$type_str = 'R_386_GOT32';
		} elsif ($type == 2) {
			$type_str = 'R_386_PC32';
		} elsif ($type == 1) {
			$type_str = 'R_386_32';
		} elsif ($type == 0) {
			$type_str = 'R_386_NONE';
		} else {
			$type_str = $type;
		}

		if ($strndx == 0) {
			print "$r_info\t$type_str\t$r_offset\n";
		} else {
			print "$r_info\t$type_str\t$r_offset\t$symtab[$strndx]\n";
		}
	}
}

#&do_symtab($SYMTAB_off, $SYMTAB_len);
#&do_strtab($STRTAB_off, $STRTAB_len);
#&do_reltab($JMPREL_off, $JMPREL_len);

#&do_reltab($REL_off, $REL_len);

&find_phdr();

print "e_phoff = $e_phoff\n";
print "e_phentsize = $e_phentsize\n";
print "e_phnum = $e_phnum\n";

&find_dynamic();
print "dyn_offset = $p_offset\n";
print "dyn_filesz = $p_filesz\n";

&parse_dynamic();
print "STRTAB\t$STRTAB_off\n"; #	= 0x10904;
print "STRSZ\t$STRTAB_len\n"; #	= 23770;

print "REL\t$REL_off\n"; #	= 0x17d4c;
print "RELSZ\t$REL_len\n"; #	= 10768;

print "JMPREL\t$JMPREL_off\n"; #	= 0x1a75c;
print "PLTRELSZ\t$JMPREL_len\n"; #	= 96;

print "SYMTAB\t$SYMTAB_off\n"; #	= 0x73f4;
print "SYMTABSZ\t$SYMTAB_len\n"; #	= $STRTAB_off-$SYMTAB_off;

&do_symtab(hex($SYMTAB_off), hex($SYMTAB_len));

&do_reltab(hex($JMPREL_off), hex($JMPREL_len));
&do_reltab(hex($REL_off), hex($REL_len));
&do_strtab(hex($STRTAB_off), hex($STRTAB_len));


#print $strtab[520],"\n";

__END__
&do_strtab($STRTAB_off, $STRTAB_len);

for (0..$#strtab) {
	print "$_\t=> $strtab[$_]\n";
}
