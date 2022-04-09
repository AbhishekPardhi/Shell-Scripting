# declare -a arr
# read -a arr
# echo ${arr[@]}

# MY_PROMPT='$ '
# while :
# do
# echo −n "$MY_PROMPT"
# read line
# eval "$line"
# done
# exit 0


#!/bin/bash
# Reading lines in /etc/fstab.
# File=/etc/fstab
# {
# read line1
# read line2
# } < $File
# echo "First line in $File is:"
# echo "$line1"
# echo
# echo "Second line in $File is:"
# echo "$line2"
# exit 0


echo "Please type two space-separated file names:"
read fileName1 fileName2 fileName3
# Condition to check if there exaclty 2 file names are given
if [[ -z "$fileName1"  ||  -z "$fileName2" ]] || [[ ! -z "$fileName3" ]]; then
echo "Please type exactly 2 file names"
exit 0
else echo "file names are set to '$fileName1' and '$fileName2'"; fi

# Condition to check if these two files exits or not
if [ ! -e "$fileName1" ]
then
    echo "File 1 doesn't exist!"
    exit 0
elif [ ! -e "$fileName2" ]
then
    echo "File 2 doesn't exist!"
    exit 0
else
    echo "Both files exists"
fi

#Writing data from Input file to Output file

# echo >> Output.txt
# while IFS= read -r line;do
#     # echo -e >> Output.txt
#     //echo "$line" >> Output.txt
#     echo "$line" | awk ,: '{print $2}' >> Output.txt
# done < "Input.csv"

printf '' > $fileName2

while IFS=, read -r Name PredominantDegree HighestDegree FundingModel Region Geography AdmissionRate ACTMedian SATAverage AverageCost Expenditure temp; do
    printf '%s %s %s %s %s %s %s %s\n' "$Name" "$PredominantDegree" "$HighestDegree" "$Region" "$Geography" "$AdmissionRate" "$AverageCost" "$Expenditure"  >> $fileName2
done < "$fileName1"

# 4th part:

printf '\n=>List of Name of the colleges whose HighestDegree is Bachelor’s:\n\n' >> $fileName2

while IFS=, read -r Name PredominantDegree HighestDegree FundingModel Region Geography AdmissionRate ACTMedian SATAverage AverageCost Expenditure temp; do
    if [ $HighestDegree == "Bachelor's" ]; then
        printf '%s\n' "$Name" >> $fileName2
    fi
done < "$fileName1"

# 5th part:

printf '\n=>Geography: Average Admission Rate\n' >> $fileName2

while IFS=, read -r Name PredominantDegree HighestDegree FundingModel Region Geography AdmissionRate ACTMedian SATAverage AverageCost Expenditure temp; do
    if [ $HighestDegree == "Bachelor's" ]; then
        printf '%s\n' "$Name" >> $fileName2
    fi
done < "$fileName1"