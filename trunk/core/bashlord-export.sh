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

EXPORTED_ARCHIVE=$1.tar.gz

#if script passed in parameter doesn't exists
if [ -e $EXPORTED_ARCHIVE ]
then
	echo "$EXPORTED_ARCHIVE already exists, type 'yes' to overwrite"
	read CONFIRM

	if [ "$CONFIRM" != "yes" ]
	then
		#operation is cancelled
		echo "Operation cancelled"
		return 0
	fi
fi

#create exported archive that contains all user's scripts
tar czvf $EXPORTED_ARCHIVE -C $BASHLORD_HOME/scripts/ $BASHLORD_HOME/scripts/*

#output success message
echo "Scripts exported to $EXPORTED_ARCHIVE"
