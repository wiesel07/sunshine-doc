#!/bin/bash
pid=`netstat -tpnl|grep 8087|awk '{print $7}'|awk -F'/' '{print $1}'`    
echo ‘$pid’
if [ -n "$pid" ] ;then
   kill -9 $pid
   echo ‘关闭$pid’
   sleep 5
fi