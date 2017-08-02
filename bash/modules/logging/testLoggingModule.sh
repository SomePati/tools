#! /bin/bash
VERSION="0.1"
AUTHOR="koep"
LOGPATH="/home/$USER/Documents/scripts/logs/"


LASTCHANGED="12.02.2017"
FULLSCRIPTNAME=$(realpath $0 -P)
SCRIPTNAME=$(basename $FULLSCRIPTNAME)


#Setting Verbose LOgging via argument "v"
if echo "$@" | grep "v" >> /dev/null
	then
	VERBOSE=0
else
	VERBOSE=1
fi

. /home/$USER/Documents/scripts/tools/modules/Logging.module 
VERSIONSTRING="$SCRIPTNAME - ${orange}Version $VERSION - $LASTCHANGED${reset} - ($AUTHOR)" 


#MAIN

LogH $LOGPATH $FULLSCRIPTNAME $@
logTest
writeTest
LogF
