#Bashlord manual

# Installation using SVN #

  1. Checkout the whole source code from SVN in ~/.bashlord
```
svn co http://bashlord.googlecode.com/svn/trunk ~/.bashlord/
```
  1. add the following lines at the end of your ~/.bashrc configuration file
```
# Bashlord
if [ -f ~/.bashlord/bashrc ]; then
    . ~/.bashlord/bashrc
fi
```
  1. Reload your bash environment
```
. ~/.bashrc
```


# Bashlord commands #
Bashlord commands are use to perform commons operation as adding, deleting, listing scripts, etc...

Syntax :
```
bashlord <command>
```

Please find below the list of available bashlord command:
## add ##
Add a new script

Syntax :
```
bashlord add <my script name>
```
## delete-all ##
Delete all scripts in the bashlord script pool
## delete ##
Delete a specific script

```
bashlord delete <my script to delete name>
```
## edit ##
Edit a specific script

```
bashlord edit <my script to edit name>
```
## help ##
Display all available bashlord commands

```
bashlord edit <my script to edit name>
```
## list ##
List all the scripts currently in the bashlord script pool

```
bashlord list
```
## reload ##
Regenerate bashrc file wich extends your standard ~/.bashrc file and reload bash environment.
You should not have to perform this operation manualy.

```
bashlord reload
```
## version ##
Display your current bashlord version
```
bashlord version
```