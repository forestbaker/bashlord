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

BASHLORD_SCRIPT=$BASHLORD_HOME/core/bashlord-$1.sh

if [ -e $BASHLORD_SCRIPT ]
then
	shift
	. $BASHLORD_SCRIPT $@
else
	echo "Bashlord unknown option: $1"
	return 1
fi
