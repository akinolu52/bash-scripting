#!/bin/bash

echo "for loop..."
languages="java python javascript typescript ruby php"
for language in $languages
do
    sleep 1
    echo "################################################################"
    echo "I can write: $language"
    echo "################################################################"
    date
done