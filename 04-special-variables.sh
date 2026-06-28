#!/bin/bash

###special variables

echo "All variables passes to script: $@"
echo "Number of varibales passed: $#"
echo "First variable $1"
echo "scropt name $0"
echo "who is running this:$USER"
echo "which directory: $PWD"
echo "Home directory: $HOME"
echo "PID of curent script $$"
sleep 5 &
echo "PID of background running just now: $!"
wait $!
echo "Line number: $LINENO"
echo "Script executed in $SECONDS seconds"
echo "exit code of previous command: $?"