#!/bin/bash

SCRIPT=$BASHLORD_HOME/scripts/$1.sh 

#if the script file we want to edit doesn't exists
if [ ! -e $SCRIPT ]
then
        echo "Script $SCRIPT doesn't exists !"	
	exit 1;		
else
	#if the script already exists we return an error
        exec $BASHLORD_EDITOR $SCRIPT
fi
