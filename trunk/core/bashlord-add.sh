#!/bin/bash

NEW_SCRIPT=$BASHLORD_HOME/scripts/$1.sh 
ALIAS=$1

#if the script file we want to create doesn't exists yet
if [ ! -e $NEW_SCRIPT ]
then
	#create script file
	echo "#!/bin/bash" > $NEW_SCRIPT
	echo "echo I am a new bashlord script, type the following command to edit the script:" >> $NEW_SCRIPT
	echo "echo bashlord edit $1" >> $NEW_SCRIPT
	chmod u+x $NEW_SCRIPT

	#add alias
	echo "alias $ALIAS='$NEW_SCRIPT'" >> $BASHLORD_HOME/conf.d/aliases

	#regenerate config
	. $BASHLORD_HOME/core/bashlord-reload.sh

else
	#if the script already exists we return an error
        echo "Script $NEW_SCRIPT already exists !"	
	return 1;		
fi
