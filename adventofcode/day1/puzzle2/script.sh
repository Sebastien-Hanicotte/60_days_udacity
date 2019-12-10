#!/bin/sh

## Initialisation of variable fuelQty ## 
fuelQty=0;

## Looping through input data ##
while read mass; do
  continue=1
  while [ "${continue}" = "1" ]; do  
    mass=$(echo ${mass} | awk '{print int($1/3)-2}')
    if [ ${mass} -gt 0 ]; then
      fuelQty=$((${fuelQty}+${mass}));
    else
      continue=0
    fi
  done;
done  < input.txt;

## Displaying result on stdout ##
echo 'We will be needing **'${fuelQty}'** tons of fuel to feed all our modules.';
