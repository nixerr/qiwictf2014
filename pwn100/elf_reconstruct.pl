#!/usr/bin/perl

use strict;
use Fcntl qw(SEEK_SET SEEK_CUR);

my $file = $ARGV[0] || die "Can i have file, please?\n";
open ELF, "<", $file;
binmode(ELF);

my $STRTAB_off	= 0xDCC;
my $STRTAB_len	= 2862;

my $REL_off	= 0x1C58;
my $REL_len	= 25216;

my $JMPREL_off	= 0x7ED8;
my $JMPREL_len	= 1368;

my $SYMTAB_off	= 0x1ec;
my $SYMTAB_len	= $STRTAB_off-$SYMTAB_off;


our @strtab;
our @reltab;
our @jmpreltab;
our @symtab;


sub do_stroff() {
	my $off		= $_[0];

	my $data;
	my $seek_old;
	my $seek_new;
	my $name;

	$seek_old = sysseek(ELF, 0, SEEK_CUR);
	$seek_new = $STRTAB_off+$off;
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
		sysread ELF, $data, 4;
		$st_name = unpack("H*", reverse($data));

		sysread ELF, $data, 4;
		$st_value = unpack("H*", reverse($data));

		sysread ELF, $data, 4;
		$st_size = unpack("H*", reverse($data));

		sysread ELF, $data, 1;
		$st_info = unpack("H*", $data);

		sysread ELF, $data, 1;
		$st_other = unpack("H*", $data);

		sysread ELF, $data, 2;
		$st_shndx = unpack("H*", reverse($data));

		my $name = &do_stroff(hex($st_name));
		print "$st_name\t$st_value\t$st_size\t$st_info\t$st_other\t$st_shndx\t$name\n"
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

	$count = $size / 8;
	for (my $i = 0; $i <= $count; $i++) {
		sysread ELF, $data, 4;
		$r_offset = unpack ("H*", reverse($data));

		sysread ELF, $data, 4;
		$r_info = unpack("H*", reverse($data));

		my $strndx = (hex($r_info) & 0x0000ff00)>>8;
		my $type   = (hex($r_info) & 0x000000ff);
		my $type_str;

		if ($type == 8) {
			$type_str = 'R_386_RELATIVE';
		} elsif ($type == 7) {
			$type_str = 'R_386_JMP_SLOT';
		} elsif ($type == 6) {
			$type_str = 'R_386_GLOB_DAT';
		} else {
			$type_str = '???';
		}


		if ($strndx == 0) {
			print "$r_info\t$type_str\t$r_offset\n";
		} else {
			print "$r_info\t$type_str\t$r_offset\t$strtab[$strndx]\n";
		}
	}
}

&do_symtab($SYMTAB_off, $SYMTAB_len);
&do_strtab($STRTAB_off, $STRTAB_len);
&do_reltab($JMPREL_off, $JMPREL_len);

&do_reltab($REL_off, $REL_len);

print $#strtab,"\n";

__END__
&do_strtab($STRTAB_off, $STRTAB_len);

for (0..$#strtab) {
	print "$_\t=> $strtab[$_]\n";
}
