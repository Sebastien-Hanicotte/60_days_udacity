#!/bin/bash

for i in `seq 0 99`; do
  for j in `seq 0 99`; do

    ## Initialisation of variables ##
    current=0;
    searchedValue=19690720;
    a=();

    ## Filling the array with content of the file ##
    while read -rd, data; do
      a+=(${data});
    done < input.txt

    ## Special replacements ##
    a[1]=${i};
    a[2]=${j};

    cont=1;
    current=0;

    ## Running the magic ##
    while [ ${cont} = 1 ]; do
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
        current=$((${current}-3))
        # echo "Intcode program as found this solution : **"${a[0]}"**";
        cont=0;
      fi;

      if [ ${a[${nextindex}]} = ${searchedValue} ]; then
        echo "The result of 100 * noun + verb is : **"$((100 * ${a[1]} + ${a[2]}))"**"
        exit 0;
      fi;

      ## Increasing by 4 the pointer to keep track ##
      current=$((${current}+4))
    done;
  done;
done;
