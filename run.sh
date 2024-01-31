#!/bin/sh
INTERFACE_ETH=$(route | grep '^default' | grep -o '[^ ]*$')
MAC_DESTINATION=$(cat interface)
etherwake -i $INTERFACE_ETH  >> run.sh