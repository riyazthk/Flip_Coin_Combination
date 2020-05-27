#! /bin/bash -x
i=0
k=0
coin=$((RANDOM%2))
declare -A arr
array=(["H"]=0 ["T"]=0)

function flip (){
    local val=$1
       coin=$((RANDOM%$val))
       echo $(( $coin ))
}

for ((l=0;$l<20;l++))
do

   val=2
   flip=$(flip $val)
   array[ (flip) ]=$(( ${array[flip]}+ 1 ))
done

for i in "${!array[@]}"
do
echo "$i=>${array[$i]} percentage =$(( (${array[$i]}*100) / 50 ))"
done

