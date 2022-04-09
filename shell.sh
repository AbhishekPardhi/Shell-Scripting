awk '{print > "Output.txt"}' Input.csv
awk -F"," '{print $1,$2,$3,$5,$6,$7,$10,$11}' Input.csv > Output.txt
echo "--------------------" >> Output.txt

# awk -F, '$3 == /Bachelor’s/' Output.txt >> Output.txt
# awk -F, '$3 == "Bachelor’s"{print $1}' Output.txt >> Output.txt
# awk -F",", '$3 == "Bachelor’s"{print $1}' Input.csv >> Output.txt
awk -F',' '{print $3}' Input.csv
awk -F, '{$3=="Bachelor’s"}1' Input.csv
