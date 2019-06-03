#!/bin/bash
cp egov-asset-smart-web-0.0.1-SNAPSHOT.jar egov-asset-smart-web.jar
pid=`netstat -tpnl|grep 8087|awk '{print $7}'|awk -F'/' '{print $1}'`    
if [ -n "$pid" ] ;then
   kill -9 $pid
   echo ‘关闭$pid’
   sleep 5
fi
echo '系统启动中...'
java -Xms1024m -Xmx2048m -jar -Djava.rmi.server.hostname=192.168.10.180 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dspring.profiles.active=dev egov-asset-smart-web.jar  > ./a.log 2>&1 &