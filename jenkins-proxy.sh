#!/bin/bash

App='api-proxy'
ProjectHome='/home/wild/proxy'
RunHome='/opt/api-proxy'
Time=`date '+%Y%m%d%H%M%S'`

cd $ProjectHome
git pull

kill -9 $(ps -ef|grep node|awk '/'$App.js'/{print $2}')

cp -f $RunHome/$App.js $RunHome/$App-$Time.js
cp -f $ProjectHome/$App.js $RunHome/$App.js
cp -f $ProjectHome/*.json $RunHome/

cd $RunHome
npm install
nohup node $App.js > $App.log 2>&1 &
