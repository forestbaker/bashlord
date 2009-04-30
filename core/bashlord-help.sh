#!/bin/bash

#echo all bashlord core scripts available as bashlord command parameter
for SCRIPT in `ls $BASHLORD_HOME/core/bashlord-*.sh | xargs -n1 basename`
do
	echo $SCRIPT | sed '/\.sh/s///g' | sed '/bashlord-/s///g'
done
