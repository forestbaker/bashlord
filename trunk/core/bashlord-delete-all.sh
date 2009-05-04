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

echo "Type 'yes' to confirm you really want to erase all your bashlord's scripts"
read CONFIRM

#if erase all user's scripts has not been confirmed
if [ "$CONFIRM" != "yes" ]
then
	#operation is cancelled
        echo "Operation cancelled"
	return 0
fi
	
#removing user's script files
rm -rf $BASHLORD_HOME/scripts/*
	
#removing aliases
> $BASHLORD_HOME/conf.d/aliases

#output success message
echo "All scripts have been deleted"

#reload config
. $BASHLORD_HOME/core/bashlord-reload.sh
