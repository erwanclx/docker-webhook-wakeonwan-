#!/bin/sh
INTERFACE_ETH=$(route | grep '^default' | grep -o '[^ ]*$')
FORMATTED_MAC=$(echo $MAC | sed 's/-/:/g')
etherwake -i $INTERFACE_ETH $FORMATTED_MAC