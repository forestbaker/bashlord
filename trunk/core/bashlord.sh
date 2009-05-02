#!/bin/bash
BASHLORD_SCRIPT=$BASHLORD_HOME/core/bashlord-$1.sh

if [ -e $BASHLORD_SCRIPT ]
then
	shift
	. $BASHLORD_SCRIPT $@
else
	echo "Bashlord wrong option: $BASHLORD_SCRIPT"
	exit 1
fi
