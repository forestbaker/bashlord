#!/bin/bash

#recreate bashlord's bashrc extension
cat $BASHLORD_HOME/conf.d/* > $BASHLORD_HOME/bashrc &&

#start a new bash env with updated aliases
exec bash
