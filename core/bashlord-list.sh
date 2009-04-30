#!/bin/bash

#echo all scripts removing .sh extension
for SCRIPT in `ls $BASHLORD_HOME/scripts/`
do
	echo $SCRIPT | sed '/\.sh/s///g'
done
