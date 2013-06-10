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

EXISTING_SCRIPT=$BASHLORD_HOME/scripts/$1.sh 
NEW_SCRIPT=$BASHLORD_HOME/scripts/$2.sh 
EXISTING_ALIAS=$1
ALIAS=$2

#if the script file we want to create already exists we return an error
if [ -e $NEW_SCRIPT ]
then
        echo "Script $NEW_SCRIPT already exists !"	
	return 1;		
fi

#copy script file
cp $EXISTING_SCRIPT $NEW_SCRIPT

#add alias
echo "alias $ALIAS='$NEW_SCRIPT'" >> $BASHLORD_HOME/conf.d/aliases

#output success message
echo "Script $ALIAS copied from $EXISTING_ALIAS"

#regenerate config
. $BASHLORD_HOME/core/bashlord-reload.sh
