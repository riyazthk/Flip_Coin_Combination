#! /bin/bash -x
i=0
k=0
coin=$((RANDOM%2))
declare -A arr
array=(["H"]=0 ["T"]=0)
array1=(["HH"]=0 ["HT"]=0 ["TH"]=0 ["TT"]=0)
array2=(["HHH"]=0 ["THH"]=0 ["HTH"]=0 ["HHT"]=0 ["HTT"]=0 ["THT"]=0 ["TTH"]=0 ["TTT"]=0)

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

   val=4
   flip=$(flip $val)
   array1[ (flip) ]=$(( ${array1[flip]}+ 1 ))

   val=8
   flip=$(flip $val)
   array2[flip]=$(( ${array2[flip]}+ 1 ))

done

for i in "${!array[@]}"
do
echo "$i=>${array[$i]} percentage =$(( (${array[$i]}*100) / 50 ))"
done

for i in "${!array1[@]}"
do
echo "$i=>${array1[$i]} percentage =$(( (${array1[$i]}*100) / 50 ))"
done

for i in "${!array2[@]}"
do
  echo "$i=>${array2[$i]} percentage =$(( (${array2[$i]}*100) / 50 ))"
done
