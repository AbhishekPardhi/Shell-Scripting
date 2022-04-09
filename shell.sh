awk '{print > "Output.txt"}' Input.csv
awk -F',' '{print $1,$2,$3,$5,$6,$7,$10,$11}' Input.csv > Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Name of the college whose HighestDegree is Bachelor's" >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

# awk -F, '$3 == /Bachelor’s/' Output.txt >> Output.txt
# awk -F, '$3 == "Bachelor’s"{print $1}' Output.txt >> Output.txt
# awk -F",", '$3 == "Bachelor’s"{print $1}' Input.csv >> Output.txt

# awk -F',' '{print $3}' Input.csv

# awk -F, '{$3=="Bachelor’s"}1' Input.csv
# awk -F',' '' Input.csv >> Output.txt

# awk 'BEGIN { FS = "," } ; { if ($3 == "Bachelor’s") 
# print $1 }' >> Output.txt
# awk -F',' '{if($3~"Bachelor") print $1;}' Input.csv >> Output.txt

awk -F',' '$3 == "Bachelor\x27s" { printf("| %s\n",$1) }' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Geography       : Average Admission Rate " >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

# awk -F',' '{
# if($3 <= 40)
# {
# print "The salary of ",$1, " is ", $4, "\n"
# }
# else
# {
# print "The age of ",$1, " is ", $3, "\n"
# }
# }' Input.csv print "Field", i, "is", $i

# gawk
# 'BEGIN { FS = "," }
# {
#     for (i = 1; i <= NR; i++)
#     {
#         if ($6 in arr)
#             arr[$6]+=$7
#         else
#             arr[$6]=0
#     }
# }'
# 'END
# {
#     for (var in arr)
#         print ,": ",var;
# }'
# Input.csv >> Output.txt

# awk -F',' 'BEGIN {
#     print NR
#     for (i = 1; i <= NR; i++)
#     {
#         print $0
#     }
# }' Input.csv >> Output.txt
# awk -F',' '{print NR-1 "," $0}' Input.csv >> Output.txt

# awk -F',' 'BEGIN{ for (i=1; i<=2; i++)
# for (j=1; j<=3; j++)
# print "haha";}' Input.csv >> Output.txt
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

# awk -F',' '{ sum += $7 } END { if (NR > 0) printf("%0.4f", sum/NR) }' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Top 5 colleges having maximum MedianEarnings   : MedianEarning" >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

awk -F',' '{ crr[$1] += $16 }
END {
PROCINFO["sorted_in"] = "@val_num_desc"
k=0
for ( i in crr )
{
    if(k==5) break;
    printf("| %s",i)
    space=47-length(i)
    for(j=0;j<space;j++) printf " ";
    print ":", crr[i]
    k++
}
}' Input.csv >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

# @val_num_asc