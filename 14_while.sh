#!/bin/bash

counter=0

while [ $counter -lt 10 ]
do
    echo "counter=$counter"
    echo "################################################################"
    counter=$(( $counter + 1 ))
    sleep 1
done