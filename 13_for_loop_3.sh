#!/bin/bash

echo "Bash version is: ${BASH_VERSION}"
for i in {0..10..2}
do
    sleep 1
    echo "################################################################"
    echo "Welcome $i times"
done