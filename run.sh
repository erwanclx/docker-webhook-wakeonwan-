#!/bin/sh
INTERFACE_ETH = route | grep '^default' | grep -o '[^ ]*$'
etherwake -i $INTERFACE_ETH MAC_DESTINATION >> run.sh