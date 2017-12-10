### First time, run the run.sh by replacing your trascriptions in the data/allTrans.txt and your dictionary in the data/local/dict/mySrcDict.
## Update wavDir accordingly.

wavDir=""; #update this file with your audio file
transFile=""; #update this file with your transcriptions file
#transFile="data/allTrans.txt"
outFile="data/split1/1/text"; 
outDir=""; # update this variable with your destination folder
mkdir -p $outDir

for i in $(find "${wavDir}/" -iname "*.wav"); 
do 
temp=`echo $i | rev | cut -d"." -f2 | cut -d"/" -f1 | rev`;
echo $temp
echo "UTTERENCE_ID" `cat $transFile | grep "\b"$temp" " | cut -d" " -f2- |sed "s/ (/=/g" | cut -d"=" -f1 | sed "s/) /=/g" | cut -d"=" -f2- | sed "s/'/XXXXX/g" | tr '[:punct:]' ' ' | tr -s " " | sed "s/XXXXX/'/g" | sed "s/ '/ /g" | tr '[A-Z]' '[a-z]'` > $outFile
./run1File.sh $i $outDir/$temp.txt
done
