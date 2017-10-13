0: jdbc:hive2://ip-10-0-1-78.ec2.internal:100> SHOW ROLE GRANT GROUP rangers;
INFO  : Compiling command(queryId=hive_20171013170404_9451f98e-e25a-4b14-a12b-d40c606980e1): SHOW ROLE GRANT GROUP rangers
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:role, type:string, comment:from deserializer), FieldSchema(name:grant_option, type:boolean, comment:from deserializer), FieldSchema(name:grant_time, type:bigint, comment:from deserializer), FieldSchema(name:grantor, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171013170404_9451f98e-e25a-4b14-a12b-d40c606980e1); Time taken: 0.084 seconds
INFO  : Executing command(queryId=hive_20171013170404_9451f98e-e25a-4b14-a12b-d40c606980e1): SHOW ROLE GRANT GROUP rangers
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171013170404_9451f98e-e25a-4b14-a12b-d40c606980e1); Time taken: 0.077 seconds
INFO  : OK
+-------------+---------------+-------------+----------+--+
|    role     | grant_option  | grant_time  | grantor  |
+-------------+---------------+-------------+----------+--+
| httpviewer  | false         | NULL        | --       |
+-------------+---------------+-------------+----------+--+
1 row selected (0.289 seconds)
0: jdbc:hive2://ip-10-0-1-78.ec2.internal:100> SHOW ROLE GRANT GROUP astros;
INFO  : Compiling command(queryId=hive_20171013170404_13c935ce-3c41-40a0-99c3-18cd0b2618dc): SHOW ROLE GRANT GROUP astros
INFO  : Semantic Analysis Completed
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:role, type:string, comment:from deserializer), FieldSchema(name:grant_option, type:boolean, comment:from deserializer), FieldSchema(name:grant_time, type:bigint, comment:from deserializer), FieldSchema(name:grantor, type:string, comment:from deserializer)], properties:null)
INFO  : Completed compiling command(queryId=hive_20171013170404_13c935ce-3c41-40a0-99c3-18cd0b2618dc); Time taken: 0.053 seconds
INFO  : Executing command(queryId=hive_20171013170404_13c935ce-3c41-40a0-99c3-18cd0b2618dc): SHOW ROLE GRANT GROUP astros
INFO  : Starting task [Stage-0:DDL] in serial mode
INFO  : Completed executing command(queryId=hive_20171013170404_13c935ce-3c41-40a0-99c3-18cd0b2618dc); Time taken: 0.023 seconds
INFO  : OK
+----------------+---------------+-------------+----------+--+
|      role      | grant_option  | grant_time  | grantor  |
+----------------+---------------+-------------+----------+--+
| serviceviewer  | false         | NULL        | --       |
+----------------+---------------+-------------+----------+--+
1 row selected (0.091 seconds)
0: jdbc:hive2://ip-10-0-1-78.ec2.internal:100> 

