#!/bin/bash

#    Bashlord, a bash scripts management tool
#    Copyright (C) 2009 Vladimir Bueb — All rights reserved
#
#
#
#    This file is part of Bashlord.
#
#    Bashlord is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Bashlord is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Bashlord.  If not, see <http://www.gnu.org/licenses/>.

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
