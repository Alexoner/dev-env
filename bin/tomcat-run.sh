#!/bin/sh

# export CATALINA_HOME=~/
for i in $($CATALINA_HOME/deploy/*)
do
    if [ `basename $i` != "taobao-hsf.sar" ]
    then
        rm -r -v $CATALINA_HOME/deploy/$i
    else
        echo $i
    fi
done

if [ "$1" != "" ]
then
    rsync -av $1 $CATALINA_HOME/deploy/
fi

