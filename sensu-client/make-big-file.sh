#!/bin/bash

FILENAME1=/tmp/bigfile1.txt
FILENAME2=/tmp/bigfile2.txt

echo "big file content" > $FILENAME1
echo "" > $FILENAME2

FILESIZE=$(stat -c%s "$FILENAME1")

while [ $FILESIZE -lt 1000000000 ]
do
  cat $FILENAME1 >> $FILENAME2
  cat $FILENAME2 >> $FILENAME1
  #TMP=$(cat $FILENAME)
  #echo "$TMP" >> $FILENAME
  #echo "big file content" >> $FILENAME

  FILESIZE=$(stat -c%s "$FILENAME1")
  echo $FILESIZE
done
