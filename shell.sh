awk '{print > "Output.txt"}' Input.csv
awk -F',' '{print $1,$2,$3,$5,$6,$7,$10,$11}' Input.csv > Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Name of the college whose HighestDegree is Bachelor's" >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

awk -F',' '$3 == "Bachelor\x27s" { printf("| %s\n",$1) }' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Geography       : Average Admission Rate " >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

awk -F',' '{ arr[$6] += $7 ; brr[$6] ++ ; if(max<length($6)) max=length($6)}
END {
for (var in arr)
{
    printf("| %s",var)
    space=max-length(var)+1
    for(i=0;i<space;i++) printf " ";
    printf(": %0.4f\n",arr[var]/brr[var])
}
}' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Top 5 colleges having maximum MedianEarnings   : MedianEarning" >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

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
}' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt