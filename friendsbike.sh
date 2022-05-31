#!/bin/bash
declare -A friend

friend["Rahul"]="BMW"
friend["Navin"]="Maruti"
friend["Kumar"]="Audi"
friend["Rohit"]="Tata"
friend["Vivek"]="Nano"
friend["Shrikant"]="Bulero"
friend["Dyaneshwar"]="Murcedi"


echo ${friend[@]}
echo "Size of friend : "${#friend[@]}
echo "keys : "${!friend[@]}

echo "***************************************************"

for keys in ${!friend[@]}
do
	echo $keys "Buying" ${!frind[$keys]} "Car in future";
done
