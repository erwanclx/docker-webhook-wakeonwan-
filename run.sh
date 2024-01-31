#!/bin/sh
FORMATTED_MAC=$(echo $MAC | sed 's/-/:/g')

interfaces=$(ifconfig | grep -o '^[^ ]*:' | sed 's/.$//')
for interface in $interfaces
do
    # echo "Sending from $interface to $FORMATTED_MAC"
    etherwake -i $interface $FORMATTED_MAC
done
