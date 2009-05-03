#!/bin/bash

SCRIPT=$BASHLORD_HOME/scripts/$1.sh 
ALIAS=$1



#if the script file we want to delete doesn't exists
if [ ! -e $SCRIPT ]
then
        echo "Script $SCRIPT doesn't exists !"	
	return 1
fi 



#ask for confirm deletion
echo "Type 'yes' to confirm you really want to erase the bashlord's scripts named '$1'"
read CONFIRM

#if erase all user's scripts has not been confirmed
if [ "$CONFIRM" != "yes" ]
then
	#operation is cancelled
        echo "Operation cancelled"
	return 0
fi



#delete script file
rm $SCRIPT

#delete alias from config
sed '/^alias\ $ALIAS=/d' $BASHLORD_HOME/conf.d/aliases > $BASHLORD_HOME/conf.d/aliases
echo "Bashlord's script $ALIAS deleted"

#reload config
. $BASHLORD_HOME/core/bashlord-reload.sh
