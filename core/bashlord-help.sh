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


echo "Usage:"
echo "  bashlord <command> [command parameters]"
echo "  blord <command> [command parameters]"
echo
echo "Available commands:"
#echo all bashlord core scripts available as bashlord command parameter
for SCRIPT in `ls $BASHLORD_HOME/core/bashlord-*.sh | xargs -n1 basename`
do
	echo "  $SCRIPT" | sed '/\.sh/s///g' | sed '/bashlord-/s///g'
done
