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


0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> SHOW TABLES;
INFO  : Compiling command(queryId=hive_20171012000606_bc515f9e-b249-426c-931a-d3fbe8e041b5): SHOW TABLES
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171012000606_bc515f9e-b249-426c-931a-d3fbe8e041b5); Time taken: 0.078 seconds
INFO  : Executing command(queryId=hive_20171012000606_bc515f9e-b249-426c-931a-d3fbe8e041b5): SHOW TABLES
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012000606_bc515f9e-b249-426c-931a-d3fbe8e041b5); Time taken: 0.139 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| customers  |
| sample_07  |
| sample_08  |
| web_logs   |
+------------+--+
4 rows selected (0.309 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> 

[root@ip-10-0-3-7 ~]# su - george
[george@ip-10-0-3-7 ~]$ kinit 
Password for george@HARSHAL.COM: 
[george@ip-10-0-3-7 ~]$ beeline 
Beeline version 1.1.0-cdh5.13.0 by Apache Hive
beeline> !connect jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
scan complete in 2ms
Connecting to jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
Connected to: Apache Hive (version 1.1.0-cdh5.13.0)
Driver: Hive JDBC (version 1.1.0-cdh5.13.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> show tables;
INFO  : Compiling command(queryId=hive_20171012002323_54791eca-7309-4b19-89eb-870d9705f242): show tables
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171012002323_54791eca-7309-4b19-89eb-870d9705f242); Time taken: 0.083 seconds
INFO  : Executing command(queryId=hive_20171012002323_54791eca-7309-4b19-89eb-870d9705f242): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012002323_54791eca-7309-4b19-89eb-870d9705f242); Time taken: 0.158 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| customers  |
| sample_07  |
| sample_08  |
| web_logs   |
+------------+--+
4 rows selected (0.338 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> Closing: 0: jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
[george@ip-10-0-3-7 ~]$ logout





[root@ip-10-0-3-7 ~]# su - ferdinand
[ferdinand@ip-10-0-3-7 ~]$ kinit
Password for ferdinand@HARSHAL.COM: 
[ferdinand@ip-10-0-3-7 ~]$ beeline
Beeline version 1.1.0-cdh5.13.0 by Apache Hive
beeline> !connect jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
scan complete in 2ms
Connecting to jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
Connected to: Apache Hive (version 1.1.0-cdh5.13.0)
Driver: Hive JDBC (version 1.1.0-cdh5.13.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> show tables;
INFO  : Compiling command(queryId=hive_20171012002424_e2bbea79-4000-4f6a-9b0b-365d398f547b): show tables
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:tab_name, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171012002424_e2bbea79-4000-4f6a-9b0b-365d398f547b); Time taken: 0.074 seconds
INFO  : Executing command(queryId=hive_20171012002424_e2bbea79-4000-4f6a-9b0b-365d398f547b): show tables
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171012002424_e2bbea79-4000-4f6a-9b0b-365d398f547b); Time taken: 0.163 seconds
INFO  : OK
+------------+--+
|  tab_name  |
+------------+--+
| sample_07  |
+------------+--+
1 row selected (0.332 seconds)
0: jdbc:hive2://ip-10-0-3-7.ec2.internal:1000> Closing: 0: jdbc:hive2://ip-10-0-3-7.ec2.internal:10000/default;principal=hive/ip-10-0-3-7.ec2.internal@HARSHAL.COM
[ferdinand@ip-10-0-3-7 ~]$ logout
[root@ip-10-0-3-7 ~]# 


```
