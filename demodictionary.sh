#!/bin/bash

declare -A sounds;

sounds["Lion"]="Roar";
sounds["Wolf"]="Howl";
sounds["Bird"]="Twitting";

echo ${sounds[@]};
echo "Size of a Dictionary : "${#sounds[@]}
echo "Keys : "${!sounds[@]}

echo ${sounds["Lion"]};

echo "---------------------------------------------"

for keys in ${!sounds[@]}
do
	echo $keys "is making" ${sounds[$keys]} "Sounds";
done
