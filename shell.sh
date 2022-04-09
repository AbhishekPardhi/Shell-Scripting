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

awk -F',' '$3 == "Bachelor\x27s" { print $1 }' Input.csv >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Geography: Average Admission Rate" >> Output.txt
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

awk -F',' 'BEGIN {
    print NR
    for (i = 1; i <= NR; i++)
    {
        print $0
    }
}' Input.csv >> Output.txt
# awk -F',' '{print NR-1 "," $0}' Input.csv >> Output.txt

# awk -F',' 'BEGIN{ for (i=1; i<=2; i++)
# for (j=1; j<=3; j++)
# print "haha";}' Input.csv >> Output.txt
awk -F',' '{ arr[$6] += $7 ; brr[$6] ++}
END {
for (var in arr)
    printf("%s: %0.4f\n",var,arr[var]/brr[var])
}' Input.csv >> Output.txt

# awk -F',' '{ sum += $7 } END { if (NR > 0) printf("%0.4f", sum/NR) }' Input.csv >> Output.txt