## Cloudera Manager service start log

```
[root@ip-10-0-1-78 yum.repos.d]# cat /var/log/cloudera-scm-server/cloudera-scm-server.log | more
2017-10-13 14:57:04,617 INFO main:com.cloudera.server.cmf.Main: Starting SCM Server. JVM Args: [-Dlog4j.configuration=file:/etc/cloudera-scm-server/log4j.properties, -D
file.encoding=UTF-8, -Dcmf.root.logger=INFO,LOGFILE, -Dcmf.log.dir=/var/log/cloudera-scm-server, -Dcmf.log.file=cloudera-scm-server.log, -Dcmf.jetty.threshhold=WARN, -D
cmf.schema.dir=/usr/share/cmf/schema, -Djava.awt.headless=true, -Djava.net.preferIPv4Stack=true, -Dpython.home=/usr/share/cmf/python, -XX:+UseConcMarkSweepGC, -XX:+UseP
arNewGC, -XX:+HeapDumpOnOutOfMemoryError, -Xmx2G, -XX:MaxPermSize=256m, -XX:+HeapDumpOnOutOfMemoryError, -XX:HeapDumpPath=/tmp, -XX:OnOutOfMemoryError=kill -9 %p], Args
: [], Version: 5.13.0 (#55 built by jenkins on 20171002-1719 git: bd657e597e6743c458ee2c9aabe808b7c972981c)
```

## Lines with "Started Jetty server"

```
[root@ip-10-0-1-78 yum.repos.d]# cat /var/log/cloudera-scm-server/cloudera-scm-server.log | grep "Started Jetty server"
2017-10-13 14:58:18,575 INFO WebServerImpl:com.cloudera.server.cmf.WebServerImpl: Started Jetty server.
[root@ip-10-0-1-78 yum.repos.d]# 
```
