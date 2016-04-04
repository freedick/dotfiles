#!/usr/bin/python
from sys import argv, stdout
def myhash(s):
	if (len(s)==0):
		 return 31337
	wat = s[0]
	return ((ord(wat)<<7)+(+ord(wat)<<3)-(ord(wat)-1)+(myhash(s[1:])>>5))&(0xffffffff)
color = (myhash(argv[1]))%16
color_upper = int(color/8)
color_lower = int(color%8)
stdout.write("\033[%d;3%dm%s"%(color_upper,color_lower,argv[1]))

