#!/bin/bash

echo
users="alpha beta gamma"
for usr in $users
do
    sleep 1
    echo "################################################################"
    echo "Adding user: $usr"
    useradd $usr
    id $usr
    echo "################################################################"
done