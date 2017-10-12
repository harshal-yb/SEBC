## Check Hadoop Group exists on all node

```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "cat /etc/group | grep hadoop"; done
10.0.3.7
hadoop:x:496:hdfs,mapred,yarn
10.0.3.37
hadoop:x:496:hdfs,mapred,yarn
10.0.3.90
hadoop:x:496:hdfs,mapred,yarn
10.0.3.95
hadoop:x:496:hdfs,mapred,yarn
10.0.3.235
hadoop:x:496:hdfs,mapred,yarn
[root@ip-10-0-3-7 ~]# 

```
## Get correct Databases export following variable

```
[root@ip-10-0-3-7 ~]# export HUE_CONF_DIR="/var/run/cloudera-scm-agent/process/`ls -alrt /var/run/cloudera-scm-agent/process | grep HUE | tail -1 | awk '{print $9}'`"
[root@ip-10-0-3-7 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-7 ~]# export HUE_CONF_DIR="/var/run/cloudera-scm-agent/process/`ls -alrt /var/run/cloudera-scm-agent/process | grep HUE | tail -1 | awk '{print $9}'`"
[root@ip-10-0-3-7 ~]# export HUE_DATABASE_PASSWORD=hue_password
[root@ip-10-0-3-7 ~]# export HUE_IGNORE_PASSWORD_SCRIPT_ERRORS=1

```

## Execute commands
```
[root@ip-10-0-3-7 ~]#  /opt/cloudera/parcels/CDH/lib/hue/build/env/bin/hue useradmin_sync_with_unix
Error: Password not present
[root@ip-10-0-3-7 ~]#

[root@ip-10-0-3-7 ~]# HUE_IGNORE_PASSWORD_SCRIPT_ERRORS=1 HUE_DATABASE_PASSWORD=hue_password /opt/cloudera/parcels/CDH/lib/hue/build/env/bin/hue changepassword harshal-yb
Error: Password not present
Changing password for user 'harshal-yb'
Password: 
```
