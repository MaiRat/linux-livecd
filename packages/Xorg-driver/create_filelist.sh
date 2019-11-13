#!/bin/bash

HOME=$(pwd)
URL="https://ftp.osuosl.org/pub/blfs/9.0/Xorg/driver-7.7-1.wget"
TMP=$(mktemp -d)
FILE=$(basename $URL)
cd $TMP && wget -q $URL --no-check-certificate

echo "# This file auto generated by $0" >> filelist

i=101
for file in $(grep -v '^#' $TMP/$FILE)
do
	wget -q https://www.x.org/pub/individual/driver/$file --no-check-certificate
	echo '' >> filelist
	echo "FILE$i= $file" >> filelist
	echo "URL-\$(FILE$i)= \$(URLBASE)/\$(FILE$i)" >> filelist
	echo "MD5-\$(FILE$i)= $(md5sum $file | awk '{print $1}')" >> filelist
	i=`expr $i + 1`
done

mv filelist $HOME
cd $HOME
rm -rf $TMP
