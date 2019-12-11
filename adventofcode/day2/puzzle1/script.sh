#!/bin/bash

## Initialisation of variables ##
current=0;
a=();

## Filling the array with content of the file ##
while read -rd, data; do 
  a+=(${data});
done < input.txt

## Special replacements ##
a[1]=12
a[2]=2

## Running the magic ##
while true; do
  ## Retrieving the index of number1, number2 and place to save result ## 
  index1=${a[((${current}+1))]}
  index2=${a[((${current}+2))]}
  nextindex=${a[((${current}+3))]}

  ## Checking firts value to 1, 2 or 99 to determine the opcode ##
  if [ ${a[${current}]} = 1 ]; then
    a[${nextindex}]=$((${a[${index1}]}+${a[${index2}]}))
  elif [ ${a[${current}]} = 2 ]; then
    a[${nextindex}]=$((${a[${index1}]}*${a[${index2}]}))
  elif [ ${a[${current}]} = 99 ]; then
    echo "Intcode program as found this solution : **"${a[0]}"**";
    exit 0;
  fi;

  ## Increasing by 4 the pointer to keep track ##
  current=$((${current}+4))
done;
