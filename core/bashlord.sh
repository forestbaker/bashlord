#!/bin/bash
BASHLORD_SCRIPT=$BASHLORD_HOME/core/bashlord-$1.sh

if [ -e $BASHLORD_SCRIPT ]
then
	shift
	. $BASHLORD_SCRIPT $@
else
	echo "Bashlord unknown option: $1"
	return 1
fi
