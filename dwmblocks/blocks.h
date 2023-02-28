//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/*{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},*/
	/*{"", "/usr/local/bin/xkblayout-state print %s",					0,		1},*/
	{"", "/home/vlad/.local/bin/sb-battery",					5,		3},
	{"", "/home/vlad/.local/bin/sb-internet",					5,		4},
	{"", "/home/vlad/.local/bin/sb-memory", 					10,		14},
	{"", "/home/vlad/.local/bin/sb-cpubar",					        5,		18},
	{"", "/home/vlad/.local/bin/sb-clock",					        60,		1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
