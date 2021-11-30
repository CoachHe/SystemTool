#!/bin/bash

#1.paste and format pbpaste into tmpData2.txt
pbpaste > /Users/coachhe/Tools/system-tools/data/tmpData.txt
sed -e "s/\r//g" /Users/coachhe/Tools/system-tools/data/tmpData.txt > /Users/coachhe/Tools/system-tools/data/tmpData2.txt

#2.get the lineNum of tmpData2.txt
lineNum=`cat /Users/coachhe/Tools/system-tools/data/tmpData2.txt | wc -l`

#3.add "" into head and tail of tmpData2.txt
head -n `expr $lineNum - 1` /Users/coachhe/Tools/system-tools/data/tmpData2.txt | awk '{printf "\"" $1 "\", "}' > /Users/coachhe/Tools/system-tools/data/tmpData3.txt
tail -n 1 /Users/coachhe/Tools/system-tools/data/tmpData2.txt | awk '{printf "\"" $1 "\""}' >> /Users/coachhe/Tools/system-tools/data/tmpData3.txt
cat /Users/coachhe/Tools/system-tools/data/tmpData3.txt | pbcopy

