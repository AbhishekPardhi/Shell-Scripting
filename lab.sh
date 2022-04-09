# This code is written by Abhishek Pardhi IIT KANPUR CSE'24

echo "Please type two space-separated file names:"
read fileName1 fileName2 fileName3
# Condition to check if there exaclty 2 file names are given
if [[ -z "$fileName1"  ||  -z "$fileName2" ]] || [[ ! -z "$fileName3" ]]; then
echo "Please type exactly 2 file names"
exit 0
fi

# Condition to check if these two files exits or not
if [ ! -e "$fileName1" ]
then
    echo "File 1 doesn't exist!"
    exit 0
elif [ ! -e "$fileName2" ]
then
    echo "File 2 doesn't exist!"
    exit 0
fi

awk -F',' '{print $1,$2,$3,$5,$6,$7,$10,$11}' "$fileName1" >"$fileName2"

echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"
echo "| Name of colleges whose HighestDegree is Bachelor's" >>"$fileName2"
echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"

awk -F',' '$3 == "Bachelor\x27s" { printf("| %s\n",$1) }' "$fileName1" >>"$fileName2"

echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"
echo "| Geography       : Average Admission Rate " >>"$fileName2"
echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"

awk -F',' '{ arr[$6] += $7 ; brr[$6] ++ ; if(max<length($6)) max=length($6)}
END {
for (var in arr)
{
    printf("| %s",var)
    space=max-length(var)+1
    for(i=0;i<space;i++) printf " ";
    printf(": %0.4f\n",arr[var]/brr[var])
}
}' "$fileName1" >>"$fileName2"

echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"
echo "| Top 5 colleges having maximum MedianEarnings   : MedianEarning" >>"$fileName2"
echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"

awk -F',' '{ crr[p++] += $16 ; drr[q++] = $1 }
END {
PROCINFO["sorted_in"] = "@val_num_desc"
k=0
for ( i in crr )
{
    if(k==5) break;
    printf("| %s",drr[i])
    space=47-length(drr[i])
    for(j=0;j<space;j++) printf " ";
    print ":", crr[i]
    k++
}
}' "$fileName1" >>"$fileName2"

echo "|-------------------------------------------------------------------------------------------------------------------------" >>"$fileName2"
