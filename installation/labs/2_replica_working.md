#Installing MySQL on CentOS 6.9
##Download and implement the official MySQL repo
<code>

[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i " wget https://dev.mysql.com/get/mysql57-community-release-el6-11.noarch.rpm;rpm -ivh mysql57-community-release-el6-11.noarch.rpm";done
#10.0.3.7
ssh: Could not resolve hostname #10.0.3.7: Name or service not known
10.0.3.37
--2017-10-09 23:15:46--  https://dev.mysql.com/get/mysql57-community-release-el6-11.noarch.rpm
Resolving dev.mysql.com... 137.254.60.11
Connecting to dev.mysql.com|137.254.60.11|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://repo.mysql.com//mysql57-community-release-el6-11.noarch.rpm [following]
--2017-10-09 23:15:46--  https://repo.mysql.com//mysql57-community-release-el6-11.noarch.rpm
Resolving repo.mysql.com... 23.52.165.231
Connecting to repo.mysql.com|23.52.165.231|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 25664 (25K) [application/x-redhat-package-manager]
Saving to: “mysql57-community-release-el6-11.noarch.rpm”

     0K .......... .......... .....                           100% 3.94M=0.006s

2017-10-09 23:15:46 (3.94 MB/s) - “mysql57-community-release-el6-11.noarch.rpm” saved [25664/25664]

warning: mysql57-community-release-el6-11.noarch.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
Preparing...                ##################################################
mysql57-community-release   ##################################################


Edited /etc/yum.repose.d/mysql-community.repo 
Disabled 5.7 Repo and enabled 5.5

# Enable the repo to install MySQL 5.5
[mysql55-community]
name=MySQL 5.5 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.5-community/el/6/$basearch/
enabled='1'
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql

[mysql57-community]
name=MySQL 5.7 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/6/$basearch/
enabled='0'
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql

</code>
## Install the mysql package on all nodes
<code>
[root@ip-10-0-3-7]# for i in `cat hosts`; do echo $i; ssh $i "yum install mysql -y";done
10.0.3.7
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Package mysql is obsoleted by mysql-community-client, trying to install mysql-community-client-5.5.57-2.el6.x86_64 instead
Resolving Dependencies
--> Running transaction check
---> Package mysql-community-client.x86_64 0:5.5.57-2.el6 will be installed
--> Processing Dependency: mysql-community-libs(x86-64) >= 5.5.8 for package: mysql-community-client-5.5.57-2.el6.x86_64
--> Running transaction check
---> Package mysql-community-libs.x86_64 0:5.5.57-2.el6 will be obsoleting
--> Processing Dependency: mysql-community-common(x86-64) >= 5.5.8 for package: mysql-community-libs-5.5.57-2.el6.x86_64
---> Package mysql-libs.x86_64 0:5.1.73-8.el6_8 will be obsoleted
--> Processing Dependency: libmysqlclient.so.16()(64bit) for package: 2:postfix-2.6.6-8.el6.x86_64
--> Processing Dependency: libmysqlclient.so.16(libmysqlclient_16)(64bit) for package: 2:postfix-2.6.6-8.el6.x86_64
--> Running transaction check
---> Package mysql-community-common.x86_64 0:5.5.57-2.el6 will be installed
---> Package mysql-community-libs-compat.x86_64 0:5.5.57-2.el6 will be obsoleting
--> Finished Dependency Resolution
</code>
##Install mysql-server on the server and replica nodes
<code>
[root@ip-10-0-3-7 ~]# yum install mysql-server
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Package mysql-server is obsoleted by mysql-community-server, trying to install mysql-community-server-5.5.57-2.el6.x86_64 instead
Resolving Dependencies
--> Running transaction check
---> Package mysql-community-server.x86_64 0:5.5.57-2.el6 will be installed
--> Finished Dependency Resolution

Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package mysql-server.x86_64 0:5.1.73-8.el6_8 will be installed
--> Processing Dependency: perl-DBD-MySQL for package: mysql-server-5.1.73-8.el6_8.x86_64
--> Running transaction check
---> Package perl-DBD-MySQL.x86_64 0:4.013-3.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                              Arch                         Version                                 Repository                                              Size
========================================================================================================================================================================
Installing:
 mysql-server                         x86_64                       5.1.73-8.el6_8                          rhui-REGION-rhel-server-releases                       8.6 M
Installing for dependencies:
 perl-DBD
 
 [root@ip-10-0-3-7 ~]# service mysqld start;chkconfig mysqld on
Initializing MySQL database:  171009 21:42:41 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
171009 21:42:41 [Note] /usr/sbin/mysqld (mysqld 5.5.57) starting as process 25862 ...
171009 21:42:41 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
171009 21:42:41 [Note] /usr/sbin/mysqld (mysqld 5.5.57) starting as process 25869 ...

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:

/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h ip-10-0-3-7.ec2.internal password 'new-password'

Alternatively you can run:
/usr/bin/mysql_secure_installation

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the manual for more instructions.

Please report any problems at http://bugs.mysql.com/

                                                           [  OK  ]
Starting mysqld:                                           [  OK  ]
[root@ip-10-0-3-7 ~]# 


</code>
###Download and copy the JDBC connector to all nodes.
<code></code>
You should not need to build a /etc/my.cnf file to start your MySQL server
<code></code>
    You will have to modify it to support replication. Check MySQL documentation.

##Start the mysqld service.
<code>
[root@ip-10-0-3-7 ~]# service mysqld start;chkconfig mysqld on
Initializing MySQL database:  171009 21:42:41 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
171009 21:42:41 [Note] /usr/sbin/mysqld (mysqld 5.5.57) starting as process 25862 ...
171009 21:42:41 [Note] Ignoring --secure-file-priv value as server is running with --bootstrap.
171009 21:42:41 [Note] /usr/sbin/mysqld (mysqld 5.5.57) starting as process 25869 ...

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:

/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h ip-10-0-3-7.ec2.internal password 'new-password'

Alternatively you can run:
/usr/bin/mysql_secure_installation

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the manual for more instructions.

Please report any problems at http://bugs.mysql.com/

                                                           [  OK  ]
Starting mysqld:                                           [  OK  ]
[root@ip-10-0-3-7 ~]# 

</code>
##Use /usr/bin/mysql_secure_installation to:
<code>
[root@ip-10-0-3-7 ~]# /usr/bin/mysql_secure_installation




NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MySQL
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!


In order to log into MySQL to secure it, we'll need the current
password for the root user.  If you've just installed MySQL, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MySQL
root user without the proper authorisation.

Set root password? [Y/n] Y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MySQL installation has an anonymous user, allowing anyone
to log into MySQL without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] n
 ... skipping.

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] Y
 ... Success!

By default, MySQL comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!

Cleaning up...



All done!  If you've completed all of the above steps, your MySQL
installation should now be secure.

Thanks for using MySQL!


[root@ip-10-0-3-7 ~]# 

[root@ip-10-0-3-7 ~]# service mysqld restart
Stopping mysqld:                                           [  OK  ]
Starting mysqld:                                           [  OK  ]
[root@ip-10-0-3-7 ~]# 
</code>

##On the master MySQL node, grant replication privileges for your replica node:

[root@ip-10-0-3-7 ~]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.5.57 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> GRANT REPLICATION SLAVE ON *.* TO 'root'@'ip-10-0-3-37.ec2.internal' IDENTIFIED BY 'Avaya123';
Query OK, 0 rows affected (0.00 sec)

mysql> SET GLOBAL binlog_format = 'ROW';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH TABLES WITH READ LOCK;
Query OK, 0 rows affected (0.00 sec)

mysql> 

Edited /etc/my.cnf Added following lines to [mysqld]
log-bin=mysql-bin
server-id=1
binlog_format=row

Restarted mysqld service 
[root@ip-10-0-3-7 ~]# service mysqld restart
Stopping mysqld:                                           [  OK  ]
Starting mysqld:                                           [  OK  ]
[root@ip-10-0-3-7 ~]# 

##In a second terminal session, log into the MySQL master and show its status:
[root@ip-10-0-3-7 ~]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.5.57-log MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+------------------+----------+--------------+------------------+
| mysql-bin.000001 |      107 |              |                  |
+------------------+----------+--------------+------------------+
1 row in set (0.00 sec)

mysql> UNLOCK TABLES;
Query OK, 0 rows affected (0.00 sec)

mysql> 


##Login to the replica server and configure a connection to the master:
Edited /etc/my.cnf on Slave server Added following lines to [mysqld]
server-id=2

Restarted mysqld service 
[root@ip-10-0-3-37 ~]# service mysqld restart
Stopping mysqld:                                           [  OK  ]
Starting mysqld:                                           [  OK  ]
[root@ip-10-0-3-37 ~]# 

[root@ip-10-0-3-37 ~]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.1.73 Source distribution

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CHANGE MASTER TO MASTER_HOST='ip-10-0-3-7.ec2.internal', MASTER_USER='root', MASTER_PASSWORD='Avaya123', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=107;
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> SHOW SLAVE STATUS \G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: ip-10-0-3-7.ec2.internal
                  Master_User: root
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000001
          Read_Master_Log_Pos: 107
               Relay_Log_File: mysqld-relay-bin.000003
                Relay_Log_Pos: 252
        Relay_Master_Log_File: mysql-bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 107
              Relay_Log_Space: 408
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
1 row in set (0.00 sec)

mysql> 

##Review your log (/var/log/mysqld.log) for errors.
No error reported on master or slave mysql instance	