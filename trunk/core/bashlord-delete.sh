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

#output success message
echo "Script $ALIAS deleted"

#reload config
. $BASHLORD_HOME/core/bashlord-reload.sh
