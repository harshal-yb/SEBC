## Install sentry
CM --> Cluster --> Add Service --> Sentry follow the Wizard

## Create a Keytab for hdfs
```
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# kadmin.local 
Authenticating as principal root/admin@HARSHAL.COM with password.
kadmin.local:  xst -norandkey -k hdfs.keytab hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type aes256-cts-hmac-sha1-96 added to keytab WRFILE:hdfs.keytab.
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:hdfs.keytab.
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des3-cbc-sha1 added to keytab WRFILE:hdfs.keytab.
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type arcfour-hmac added to keytab WRFILE:hdfs.keytab.
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des-hmac-sha1 added to keytab WRFILE:hdfs.keytab.
Entry for principal hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des-cbc-md5 added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type aes256-cts-hmac-sha1-96 added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type aes128-cts-hmac-sha1-96 added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des3-cbc-sha1 added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type arcfour-hmac added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des-hmac-sha1 added to keytab WRFILE:hdfs.keytab.
Entry for principal HTTP/ip-10-0-3-7.ec2.internal@HARSHAL.COM with kvno 2, encryption type des-cbc-md5 added to keytab WRFILE:hdfs.keytab.
kadmin.local:  quit
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# mv hdfs.keytab /home/harshal/
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# chown harshal:harshal /home/harshal/hdfs.keytab 
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# su - harshal
[harshal@ip-10-0-3-7 ~]$ kinit hdfs/ip-10-0-3-7.ec2.internal -k -t ./hdfs.keytab
[harshal@ip-10-0-3-7 ~]$ klist
Ticket cache: FILE:/tmp/krb5cc_502
Default principal: hdfs/ip-10-0-3-7.ec2.internal@HARSHAL.COM

Valid starting     Expires            Service principal
10/11/17 22:07:58  10/12/17 22:07:58  krbtgt/HARSHAL.COM@HARSHAL.COM
	renew until 10/18/17 22:07:58
[harshal@ip-10-0-3-7 ~]$ 
```
## Setting Hive Warehouse Directory Permissions
```
[harshal@ip-10-0-3-7 ~]$ hdfs dfs -chmod -R 771 /user/hive/warehouse
[harshal@ip-10-0-3-7 ~]$ hdfs dfs -chown -R hive:hive /user/hive/warehouse
[harshal@ip-10-0-3-7 ~]$ hdfs dfs -ls /user/hive
Found 1 items
drwxrwx--t   - hive hive          0 2017-10-11 20:27 /user/hive/warehouse
[harshal@ip-10-0-3-7 ~]$ 
```
## Block the Hive CLI user from accessing the Hive metastore:
CM --> Hive --> Configuration --> search for Hive Metastore Access Control and Proxy User Groups Override --> add hive and hue --> save
 
## Enabling the Sentry Service for Hive

CM --> Hive --> Configuration -->  Hive (Service-Wide) -->   Enable Sentry --> save restart hive    

Enable Stored Notifications in Database -- enabled it

## Created Group sentry test on all server
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "groupadd sentrytest"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]#
```
## User harshal Added to group sentrytest
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "usermod -G sentrytest harshal"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "id harshal"; done
10.0.3.7
uid=502(harshal) gid=502(harshal) groups=503(sentrytest),502(harshal)
10.0.3.37
uid=502(harshal) gid=502(harshal) groups=503(sentrytest),502(harshal)
10.0.3.90
uid=502(harshal) gid=502(harshal) groups=503(sentrytest),502(harshal)
10.0.3.95
uid=502(harshal) gid=502(harshal) groups=503(sentrytest),502(harshal)
10.0.3.235
uid=502(harshal) gid=502(harshal) groups=503(sentrytest),502(harshal)
[root@ip-10-0-3-7 ~]# 
```
## Added group sentry to the sentry.service.admin.group list 
restarted sentry hive hue services

## Login as user harshal and get kerberos ticket
```
[root@ip-10-0-3-7 ~]# su - harshal
[harshal@ip-10-0-3-7 ~]$ kdestroy 
[harshal@ip-10-0-3-7 ~]$ klist
klist: No credentials cache found (ticket cache FILE:/tmp/krb5cc_502)
[harshal@ip-10-0-3-7 ~]$ kinit 
Password for harshal@HARSHAL.COM: 
[harshal@ip-10-0-3-7 ~]$ klist
Ticket cache: FILE:/tmp/krb5cc_502
Default principal: harshal@HARSHAL.COM

Valid starting     Expires            Service principal
10/11/17 23:53:50  10/12/17 23:53:50  krbtgt/HARSHAL.COM@HARSHAL.COM
	renew until 10/18/17 23:53:50
[harshal@ip-10-0-3-7 ~]$ 
```
## Test access for user harshal
```
[harshal@ip-10-0-3-7 ~]$ beeline 
Beeline version 1.1.0-cdh5.13.0 by Apache Hive
beeline> !connect jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
scan complete in 2ms
Connecting to jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
Connected to: Apache Hive (version 1.1.0-cdh5.13.0)
Driver: Hive JDBC (version 1.1.0-cdh5.13.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> show tables;
INFO  : Compiling command(queryId=hive_20171012000101_e63fecdb-9385-437f-94f5-dd4b7156046f): show tables
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171012000101_e63fecdb-9385-437f-94f5-dd4b7156046f); Time taken: 0.886 seconds
INFO  : Executing command(queryId=hive_20171012000101_e63fecdb-9385-437f-94f5-dd4b7156046f): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012000101_e63fecdb-9385-437f-94f5-dd4b7156046f); Time taken: 0.361 seconds
INFO  : OK
+-----------+--+
| tab_name  |
+-----------+--+
+-----------+--+
No rows selected (2.738 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000>
```
## Add sentry permission for sentrytest group
```

0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> CREATE ROLE sentry_admin;
INFO  : Compiling command(queryId=hive_20171012000303_314ffcfa-4c3c-48bc-8d00-45db87e19d8b): CREATE ROLE sentry_admin
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012000303_314ffcfa-4c3c-48bc-8d00-45db87e19d8b); Time taken: 0.094 seconds
INFO  : Executing command(queryId=hive_20171012000303_314ffcfa-4c3c-48bc-8d00-45db87e19d8b): CREATE ROLE sentry_admin
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012000303_314ffcfa-4c3c-48bc-8d00-45db87e19d8b); Time taken: 0.271 seconds
INFO  : OK
No rows affected (0.381 seconds)

0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT ALL ON SERVER server1 TO ROLE sentry_admin;
INFO  : Compiling command(queryId=hive_20171012000404_4401a119-3408-4cf2-a451-c9138e1aa7fc): GRANT ALL ON SERVER server1 TO ROLE sentry_admin
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012000404_4401a119-3408-4cf2-a451-c9138e1aa7fc); Time taken: 0.092 seconds
INFO  : Executing command(queryId=hive_20171012000404_4401a119-3408-4cf2-a451-c9138e1aa7fc): GRANT ALL ON SERVER server1 TO ROLE sentry_admin
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012000404_4401a119-3408-4cf2-a451-c9138e1aa7fc); Time taken: 0.05 seconds
INFO  : OK
No rows affected (0.158 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> 

0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT ROLE sentry_admin TO GROUP sentrytest;
INFO  : Compiling command(queryId=hive_20171012000505_88200105-b887-4364-b15c-344c7afbeff2): GRANT ROLE sentry_admin TO GROUP sentrytest
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012000505_88200105-b887-4364-b15c-344c7afbeff2); Time taken: 0.075 seconds
INFO  : Executing command(queryId=hive_20171012000505_88200105-b887-4364-b15c-344c7afbeff2): GRANT ROLE sentry_admin TO GROUP sentrytest
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012000505_88200105-b887-4364-b15c-344c7afbeff2); Time taken: 0.079 seconds
INFO  : OK
No rows affected (0.168 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> 


```

## Added 2 groups selector and inserters
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "groupadd selector"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "groupadd inserters"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]# 
```
## Added user to each of the above group
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "useradd -u 1100 -g selector george"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "useradd -u 1200 -g inserters ferdinand"; done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 ~]# 
```
## Addd principle in kerberos databases
```
[root@ip-10-0-3-7 ~]# kadmin.local 
Authenticating as principal root/admin@HARSHAL.COM with password.
kadmin.local:  add_principal george
WARNING: no policy specified for george@HARSHAL.COM; defaulting to no policy
Enter password for principal "george@HARSHAL.COM": 
Re-enter password for principal "george@HARSHAL.COM": 
Principal "george@HARSHAL.COM" created.
kadmin.local:  add_principal ferdinand
WARNING: no policy specified for ferdinand@HARSHAL.COM; defaulting to no policy
Enter password for principal "ferdinand@HARSHAL.COM": 
Re-enter password for principal "ferdinand@HARSHAL.COM": 
Principal "ferdinand@HARSHAL.COM" created.
kadmin.local:  quit
```
## Add sentry roles and grant privileges 
```
[root@ip-10-0-3-7 ~]# su - harshal
[harshal@ip-10-0-3-7 ~]$ beeline 
Beeline version 1.1.0-cdh5.13.0 by Apache Hive
beeline> !connect jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
scan complete in 2ms
Connecting to jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
Connected to: Apache Hive (version 1.1.0-cdh5.13.0)
Driver: Hive JDBC (version 1.1.0-cdh5.13.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> CREATE ROLE reads;
INFO  : Compiling command(queryId=hive_20171012001818_fc4072f6-30af-41fe-99f3-8a086b687c29): CREATE ROLE reads
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001818_fc4072f6-30af-41fe-99f3-8a086b687c29); Time taken: 0.115 seconds
INFO  : Executing command(queryId=hive_20171012001818_fc4072f6-30af-41fe-99f3-8a086b687c29): CREATE ROLE reads
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001818_fc4072f6-30af-41fe-99f3-8a086b687c29); Time taken: 0.044 seconds
INFO  : OK
No rows affected (0.226 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> CREATE ROLE writes;
INFO  : Compiling command(queryId=hive_20171012001818_0efc5375-eff5-457b-b02a-e90b114466ef): CREATE ROLE writes
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001818_0efc5375-eff5-457b-b02a-e90b114466ef); Time taken: 0.06 seconds
INFO  : Executing command(queryId=hive_20171012001818_0efc5375-eff5-457b-b02a-e90b114466ef): CREATE ROLE writes
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001818_0efc5375-eff5-457b-b02a-e90b114466ef); Time taken: 0.016 seconds
INFO  : OK
No rows affected (0.09 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT SELECT ON DATABASE default TO ROLE reads;
INFO  : Compiling command(queryId=hive_20171012001818_316dacc8-b772-4011-8f7c-cd1758edc402): GRANT SELECT ON DATABASE default TO ROLE reads
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001818_316dacc8-b772-4011-8f7c-cd1758edc402); Time taken: 0.068 seconds
INFO  : Executing command(queryId=hive_20171012001818_316dacc8-b772-4011-8f7c-cd1758edc402): GRANT SELECT ON DATABASE default TO ROLE reads
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001818_316dacc8-b772-4011-8f7c-cd1758edc402); Time taken: 0.026 seconds
INFO  : OK
No rows affected (0.11 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT ROLE reads TO GROUP selector;
INFO  : Compiling command(queryId=hive_20171012001818_3dd449de-4d27-46c3-9998-23cceaea6e62): GRANT ROLE reads TO GROUP selector
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001818_3dd449de-4d27-46c3-9998-23cceaea6e62); Time taken: 0.065 seconds
INFO  : Executing command(queryId=hive_20171012001818_3dd449de-4d27-46c3-9998-23cceaea6e62): GRANT ROLE reads TO GROUP selector
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001818_3dd449de-4d27-46c3-9998-23cceaea6e62); Time taken: 0.029 seconds
INFO  : OK
No rows affected (0.105 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> REVOKE ALL ON DATABASE default FROM ROLE writes;
INFO  : Compiling command(queryId=hive_20171012001919_dc44d8da-7b1b-4302-86a7-ccd128c4ebbc): REVOKE ALL ON DATABASE default FROM ROLE writes
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001919_dc44d8da-7b1b-4302-86a7-ccd128c4ebbc); Time taken: 0.083 seconds
INFO  : Executing command(queryId=hive_20171012001919_dc44d8da-7b1b-4302-86a7-ccd128c4ebbc): REVOKE ALL ON DATABASE default FROM ROLE writes
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001919_dc44d8da-7b1b-4302-86a7-ccd128c4ebbc); Time taken: 0.189 seconds
INFO  : OK
No rows affected (0.297 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> 
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT SELECT ON default.sample_07 TO ROLE writes;
INFO  : Compiling command(queryId=hive_20171012001919_c3124583-50e8-47f5-b6f3-992ba65a8c95): GRANT SELECT ON default.sample_07 TO ROLE writes
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001919_c3124583-50e8-47f5-b6f3-992ba65a8c95); Time taken: 0.063 seconds
INFO  : Executing command(queryId=hive_20171012001919_c3124583-50e8-47f5-b6f3-992ba65a8c95): GRANT SELECT ON default.sample_07 TO ROLE writes
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001919_c3124583-50e8-47f5-b6f3-992ba65a8c95); Time taken: 0.02 seconds
INFO  : OK
No rows affected (0.096 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> GRANT ROLE writes TO GROUP inserters;
INFO  : Compiling command(queryId=hive_20171012001919_cf8a9994-cd40-4246-8419-5577495b4cad): GRANT ROLE writes TO GROUP inserters
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:null, properties:null)
INFO  : Completed compiling command(queryId=hive_20171012001919_cf8a9994-cd40-4246-8419-5577495b4cad); Time taken: 0.066 seconds
INFO  : Executing command(queryId=hive_20171012001919_cf8a9994-cd40-4246-8419-5577495b4cad): GRANT ROLE writes TO GROUP inserters
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012001919_cf8a9994-cd40-4246-8419-5577495b4cad); Time taken: 0.017 seconds
INFO  : OK
No rows affected (0.093 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> 
```
## Test the access




