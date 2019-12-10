#!/bin/sh

## Initialisation of variable fuelQty ## 
fuelQty=0;

## Looping through input data ##
while read mass; do 
  fuelQty=$((${fuelQty}+$(echo ${mass} | awk '{print int($1/3)-2}')));
done  < input.txt;

## Displaying result on stdout ##
echo 'We will be needing **'${fuelQty}'** tons of fuel to feed all our modules.';
