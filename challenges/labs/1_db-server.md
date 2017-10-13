## Database server
```
[root@ip-10-0-1-65 ~]# hostname -f
ip-10-0-1-65.ec2.internal
[root@ip-10-0-1-65 ~]# 
```

## Database Version

```
[root@ip-10-0-1-65 ~]# mysql -u root -p -e "status;"
Enter password: 
--------------
mysql  Ver 14.14 Distrib 5.5.57, for Linux (x86_64) using readline 5.1

Connection id:		12
Current database:	
Current user:		root@localhost
SSL:			Not in use
Current pager:		stdout
Using outfile:		''
Using delimiter:	;
Server version:		5.5.57 MySQL Community Server (GPL)
Protocol version:	10
Connection:		Localhost via UNIX socket
Server characterset:	latin1
Db     characterset:	latin1
Client characterset:	utf8
Conn.  characterset:	utf8
UNIX socket:		/var/lib/mysql/mysql.sock
Uptime:			5 min 40 sec

Threads: 1  Questions: 44  Slow queries: 0  Opens: 34  Flush tables: 1  Open tables: 27  Queries per second avg: 0.129
--------------

[root@ip-10-0-1-65 ~]# 

```

## Database list

```
[root@ip-10-0-1-65 ~]# mysql -u root -p -e "show databases;"
Enter password: 
+--------------------+
| Database           |
+--------------------+
| information_schema |
| hive               |
| hue                |
| mysql              |
| oozie              |
| performance_schema |
| rman               |
| scm                |
| sentry             |
+--------------------+
[root@ip-10-0-1-65 ~]# 

```
