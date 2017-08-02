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

while getopts ":hV" opt; do
	case  $opt in
	h)
		WriteC "Usage:"
		WriteC " -v ... Verbose output, needs to be first option -v.."
		WriteC " -V ... Version"
		WriteC " -h ... this help msg"
		WriteC " -s ... sourcepath"
		WriteC " -d ... destinationpath"
		WriteC " -r ... recursive copy process"
		
		WriteC "$VERSIONSTRING"
		LogF
		exit 0
	;;	
	V)
		WriteC "$VERSIONSTRING"
		LogF
		exit 0
	;;
	:)
		WriteC "Option -$OPTARG requires an argument\n" >&2
		LogF
		exit 1
	;;	esac
done

LogF