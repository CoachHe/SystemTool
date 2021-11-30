#!/bin/bash

#1.format the paster into tmpData3.txt
pbpaste > /Users/coachhe/Tools/system-tools/data/tmpData.txt
sed -e "s/\r//g" /Users/coachhe/Tools/system-tools/data/tmpData.txt > /Users/coachhe/Tools/system-tools/data/tmpData2.txt
sed -e 's/[ ][ ]*/|/g; s/\t/|/g' /Users/coachhe/Tools/system-tools/data/tmpData2.txt > /Users/coachhe/Tools/system-tools/data/tmpData3.txt

#2.print line 1 into tmpData4.txt
awk 'NR==1'{print} /Users/coachhe/Tools/system-tools/data/tmpData3.txt > /Users/coachhe/Tools/system-tools/data/tmpData4.txt


#3.print line 2 into tmpData4.txt --- the seperate line
num=`grep -o '|' /Users/coachhe/Tools/system-tools/data/tmpData4.txt | wc -l`
newStr=""
for((i=0;i<=$num-1;i++));
do
    newStr="$newStr|---"
done
newStr="$newStr|"
echo $newStr >> /Users/coachhe/Tools/system-tools/data/tmpData4.txt

#4.print the line after line 2 into tmpData4.txt
awk 'NR!=1'{print} /Users/coachhe/Tools/system-tools/data/tmpData3.txt >> /Users/coachhe/Tools/system-tools/data/tmpData4.txt

#5.add the "|" signal and put the final data to tmpData.txt
cat /Users/coachhe/Tools/system-tools/data/tmpData4.txt | awk 'NR==1'{print} | awk '{print "|" $0 "|"}' > /Users/coachhe/Tools/system-tools/data/tmpData.txt
cat /Users/coachhe/Tools/system-tools/data/tmpData4.txt | awk 'NR==2'{print} >> /Users/coachhe/Tools/system-tools/data/tmpData.txt
cat /Users/coachhe/Tools/system-tools/data/tmpData4.txt | awk 'NR!=2'{print} | awk 'NR!=1'{print} |  awk '{print "|" $0 "|"}' >> /Users/coachhe/Tools/system-tools/data/tmpData.txt
cat /Users/coachhe/Tools/system-tools/data/tmpData.txt | pbcopy
