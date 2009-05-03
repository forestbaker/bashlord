#!/bin/bash
echo "Type 'yes' to confirm you really want to erase all your bashlord's scripts"
read CONFIRM

#if erase all user's scripts has not been confirmed
if [ "$CONFIRM" != "yes" ]
then
	#operation is cancelled
        echo "Operation cancelled"
	return 0
fi
	
#removing user's script files
rm -rf $BASHLORD_HOME/scripts/*
	
#removing aliases
> $BASHLORD_HOME/conf.d/aliases

#reload config
. $BASHLORD_HOME/core/bashlord-reload.sh

echo "All scripts have been erased"
