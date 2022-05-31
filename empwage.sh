#!/bin/bash
PRESENT=1;
PART_TIME=2;
WAGE_PER_HOUR=20;
WORKING_HOUR=8;
MAX_WORKING_HOUR=40;
MAX_WORKING_DAY=20;

declare -A dailyWage;

function getWorkingHour() {

	case $1 in
		$PRESENT)
			workingHour=$WORKING_HOUR;
		;;
		$PART_TIME)
			workingHour=$((WORKING_HOUR/2));
		;;
		*)
			workingHour=0;
		;;
	esac
	echo $workingHour;
}
totalWorkingHour=0;
day=0;
while [[ $day -lt $MAX_WORKING_DAY && $totalWorkingHour -lt $MAX_WORKING_HOUR ]]
do
	if [ $totalWorkingHour -eq $((MAX_WORKING_HOUR - WORKING_HOUR/2)) ]
	then
		isPresent=$PART_TIME;
	else
		isPresent=$((RANDOM%3));
	fi

	empHr=$(getWorkingHour $isPresent);
	dailyWage[$day]=$(( empHr * WAGE_PER_HOUR ));
	dailyWage["Day"$((day+1))]=$(( empHr * WAGE_PER_HOUR ));
	totalWorkingHour=$((totalWorkingHour + empHr));
	((day++));
done
totalSalary=$((WAGE_PER_HOUR * totalWorkingHour));
echo "Total salary of month : $"$totalSalary "USD";
echo "Total Working day : $day";

echo "Daily wage : "${dailyWage[@]};
echo "Keys :" ${!dailyWage[@]};

for ((i=0;i<${#dailyWage[@]};i++))
do
	echo "Day $i : $"${dailyWage[i]} "USD";
	echo "Day$((i+1)) : $"${dailyWage["Day"$((i+1))]} "USD";
done

echo "--------------------------------------"

for days in ${!dailyWage[@]}
do
	echo "$days :  $"${dailyWage[$days]} "USD"
done
