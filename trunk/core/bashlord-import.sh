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

#if script passed in parameter doesn't exists
if [ ! -e $1 ]
then
	echo "$1 doesn't exists !"
	return 1
fi

SCRIPT_NAME=`basename $1`
ALIAS=`echo $SCRIPT_NAME | sed '/\.sh/s///g'`
SCRIPT_DESTINATION=$BASHLORD_HOME/scripts/$SCRIPT_NAME 

#if script we want to import already exists
if [ -e $SCRIPT_DESTINATION ]
then
	#we ask for an overwrite
	echo "Script $ALIAS already exists, type 'yes' to overwrite"
	read CONFIRM

	if [ "$CONFIRM" != "yes" ]
	then
		#operation is cancelled
		echo "Operation cancelled"
		return 0
	fi

fi

#copy the script to bashlord's scripts folder
cp $1 $SCRIPT_DESTINATION

#add alias
echo "alias $ALIAS='$SCRIPT_DESTINATION'" >> $BASHLORD_HOME/conf.d/aliases

#output success message
echo "Script $ALIAS imported"

#regenerate config
. $BASHLORD_HOME/core/bashlord-reload.sh
