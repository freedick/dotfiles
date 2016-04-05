#!/usr/bin/python
from sys import argv, stdout
def myhash(s):
	if (len(s)==0):
		 return 13371337
	inner_hash = myhash(s[1:])

	wat = s[0]
	return ((ord(wat)<<31)+(ord(wat)<<3)-(ord(wat)+1)+(inner_hash<<5)+(inner_hash>>5))&(0xffffffff)
if len(argv)<2:
    argv.append("test")
color = (myhash(argv[1]))%16
color_upper = int(color/8)
color_lower = int(color%8)
stdout.write("\033[%d;3%dm%s"%(color_upper,color_lower,argv[1]))

