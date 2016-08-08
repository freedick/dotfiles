#!/usr/bin/python
from sys import argv, stdout
def myhash(s):
	if (len(s)==0):
		 return 13371337
	inner_hash = myhash(s[1:])

	wat = s[0]
	return ((ord(wat)<<31)+(ord(wat)<<3)-(ord(wat)+1)+(inner_hash<<5)+(inner_hash>>5))&(0xffffffff)

def get_battery_level():
	level = -1
	try:
		with open("/sys/class/power_supply/BAT0/uevent","r") as f:
			uevent_contents = f.read()
			property_list = [tuple(x.split("=")) for x in uevent_contents.split("\n") if len(x.split("="))==2]
			properties = dict(property_list)
			level = int(properties['POWER_SUPPLY_CHARGE_NOW'])*100/int(properties['POWER_SUPPLY_CHARGE_FULL'])
	except Exception as e:
		level = -1
	return min(level,100)

if len(argv)<2:
	argv.append("test")

color = (myhash(argv[1]))%16
color_upper = int(color/8)
color_lower = int(color%8)

stdout.write("\033[%d;3%dm%s"%(color_upper,color_lower,argv[1]))
if argv[1]=="clamps": # Battery monitoring on laptop
	battery_level = get_battery_level()
	stdout.write("(%3d"%battery_level+"%%)") # percent signs are filtered by zsh


