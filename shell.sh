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
awk -F',' '{if($3~"Bachelor") print $1;}' Input.csv >> Output.txt

echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt
echo "| Geography: Average Admission Rate" >> Output.txt
echo "|-------------------------------------------------------------------------------------------------------------------------" >> Output.txt

$ awk -F',' '{
if($3 <= 40)
{
print "The salary of ",$1, " is ", $4, "\n"
}
else
{
print "The age of ",$1, " is ", $3, "\n"
}
}' Input.csv