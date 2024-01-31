#!/bin/sh
INTERFACE_ETH=$(route | grep '^default' | grep -o '[^ ]*$')
MAC_DESTINATION=$(cat interface)
# ='${1//[-]/:}'
MAC_DESTINATION=$(echo $MAC_DESTINATION | sed 's/-/:/g')
etherwake -i $INTERFACE_ETH  >> run.sh