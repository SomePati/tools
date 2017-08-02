#! /bin/bash
#history
#20.may
#default links file
#default downloadpath
#$1 - specifies DownloadPath

#info
#download zdf vids with wget
UriFile="/home/pati/Documents/scripts/links"
if [ -z "$1" ]
then DownloadPath="/media/pati/1.5TB1/WebDownloads/NewDowns/%(title)s.%(ext)s}"
else DownloadPath="$1%(title)s.%(ext)s"
fi

echo "start download"
date
while read -r line
do
    echo "downloading : - $line"
	youtube-dl -o $DownloadPath $line
done < "$UriFile"
date
echo "end"

