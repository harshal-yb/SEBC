# Install Cloudera Manager
## Install Oracle JDK
[root@ip-10-0-3-7 ~]# wget http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm?AuthParam=1507587837_cb386185e667146d030ed60b916fa524
--2017-10-09 22:23:35--  http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm?AuthParam=1507587837_cb386185e667146d030ed60b916fa524
Resolving download.oracle.com... 23.215.130.50, 23.215.130.65
Connecting to download.oracle.com|23.215.130.50|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 169971490 (162M) [application/x-redhat-package-manager]
Saving to: “jdk-8u144-linux-x64.rpm?AuthParam=1507587837_cb386185e667146d030ed60b916fa524”

100%[==============================================================================================================================>] 169,971,490 11.9M/s   in 11s     

2017-10-09 22:23:46 (14.9 MB/s) - “jdk-8u144-linux-x64.rpm?AuthParam=1507587837_cb386185e667146d030ed60b916fa524” saved [169971490/169971490]

[root@ip-10-0-3-7 ~]# mv jdk-8u144-linux-x64.rpm\?AuthParam\=1507587837_cb386185e667146d030ed60b916fa524 jdk-8u144-linux-x64.rpm
mv: overwrite `jdk-8u144-linux-x64.rpm'? y
[root@ip-10-0-3-7 ~]# yum install jdk-8u144-linux-x64.rpm 
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Examining jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
Marking jdk-8u144-linux-x64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs will be installed
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                               Arch                            Version                                      Repository                                     Size
========================================================================================================================================================================
Installing:
 jdk1.8.0_144                          x86_64                          2000:1.8.0_144-fcs                           /jdk-8u144-linux-x64                          269 M

Transaction Summary
========================================================================================================================================================================
Install       1 Package(s)

Total size: 269 M
Installed size: 269 M
Is this ok [y/N]: y
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                                                                                                               1/1 
Unpacking JAR files...
	tools.jar...
	plugin.jar...
	javaws.jar...
	deploy.jar...
	rt.jar...
	jsse.jar...
	charsets.jar...
	localedata.jar...
  Verifying  : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                                                                                                               1/1 

Installed:
  jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs                                                                                                                                

Complete!
[root@ip-10-0-3-7 ~]# 

# Install a supported JDBC connector on all nodes
wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.44.tar.gz
tar -zxvf mysql-connector-java-5.1.44.tar.gz 
mkdir -p /usr/share/java/
cp mysql-connector-java-5.1.44/mysql-connector-java-5.1.44-bin.jar /usr/share/java/mysql-connector-java.jar
##Create the databases and access grants you will need
[root@ip-10-0-3-7 ~]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.5.57-log MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database amon DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.01 sec)

mysql> create database rman DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> create database hive DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> create database sentry DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> create database hue DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> create database oozie DEFAULT CHARACTER SET utf8;
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> grant all on oozie.* TO 'oozie'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'oozie_password';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all on amon.* TO 'amon'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'amon_password';
Query OK, 0 rows affected (0.01 sec)

mysql> grant all on rman.* TO 'rman'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'rman_password';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all on hive.* TO 'hive'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'hive_password';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all on sentry.* TO 'sentry'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'sentry_password';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all on hue.* TO 'hue'@'ip-10-0-3-7.ec2.internal' IDENTIFIED BY 'hue_password';
Query OK, 0 rows affected (0.00 sec)


mysql> 

## Configure Cloudera Manager to connect to the database
### Download Cloudera Manager repo
[root@ip-10-0-3-7 ~]# cd /etc/yum.repos.d/
[root@ip-10-0-3-7 yum.repos.d]# wget https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
--2017-10-09 23:33:16--  https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
Resolving archive.cloudera.com... 151.101.32.167
Connecting to archive.cloudera.com|151.101.32.167|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 290
Saving to: “cloudera-manager.repo”

100%[==============================================================================================================================>] 290         --.-K/s   in 0s      

2017-10-09 23:33:17 (18.4 MB/s) - “cloudera-manager.repo” saved [290/290]

[root@ip-10-0-3-7 yum.repos.d]# 
### Edit repo to install 5.9.3 CM
From :
baseurl=https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5/
To :
baseurl=https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5.9.3/
### Install Cloudera Manager rpms
[root@ip-10-0-3-7 yum.repos.d]# yum install cloudera-manager-daemons cloudera-manager-server
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Repository mysql-tools-preview is listed more than once in the configuration
Repository mysql-tools-preview is listed more than once in the configuration
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package cloudera-manager-daemons.x86_64 0:5.9.3-1.cm593.p0.6.el6 will be installed
---> Package cloudera-manager-server.x86_64 0:5.9.3-1.cm593.p0.6.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                                        Arch                         Version                                       Repository                              Size
========================================================================================================================================================================
Installing:
 cloudera-manager-daemons                       x86_64                       5.9.3-1.cm593.p0.6.el6                        cloudera-manager                       524 M
 cloudera-manager-server                        x86_64                       5.9.3-1.cm593.p0.6.el6                        cloudera-manager                       8.3 k

Transaction Summary
========================================================================================================================================================================
Install       2 Package(s)

Total download size: 524 M
Installed size: 659 M
Is this ok [y/N]: y
Downloading Packages:
(1/2): cloudera-manager-daemons-5.9.3-1.cm593.p0.6.el6.x86_64.rpm                                                                                | 524 MB     00:07     
(2/2): cloudera-manager-server-5.9.3-1.cm593.p0.6.el6.x86_64.rpm                                                                                 | 8.3 kB     00:00     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                    67 MB/s | 524 MB     00:07     
warning: rpmts_HdrFromFdno: Header V4 DSA/SHA1 Signature, key ID e8f86acd: NOKEY
Retrieving key from https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/RPM-GPG-KEY-cloudera
Importing GPG key 0xE8F86ACD:
 Userid: "Yum Maintainer <webmaster@cloudera.com>"
 From  : https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/RPM-GPG-KEY-cloudera
Is this ok [y/N]: y
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : cloudera-manager-daemons-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                               1/2 
  Installing : cloudera-manager-server-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                2/2 
  Verifying  : cloudera-manager-daemons-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                               1/2 
  Verifying  : cloudera-manager-server-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                2/2 

Installed:
  cloudera-manager-daemons.x86_64 0:5.9.3-1.cm593.p0.6.el6                            cloudera-manager-server.x86_64 0:5.9.3-1.cm593.p0.6.el6                           

Complete!
[root@ip-10-0-3-7 yum.repos.d]# 

/usr/share/cmf/schema/scm_prepare_database.sh mysql rman rman rman_password -h ip-10-0-3-7.ec2.internal
/usr/share/cmf/schema/scm_prepare_database.sh mysql amon amon amon_password -h ip-10-0-3-7.ec2.internal
/usr/share/cmf/schema/scm_prepare_database.sh mysql hive hive hive_password -h ip-10-0-3-7.ec2.internal
/usr/share/cmf/schema/scm_prepare_database.sh mysql sentry sentry sentry_password -h ip-10-0-3-7.ec2.internal
/usr/share/cmf/schema/scm_prepare_database.sh mysql hue hue hue_password -h ip-10-0-3-7.ec2.internal
/usr/share/cmf/schema/scm_prepare_database.sh mysql oozie oozie oozie_password -h ip-10-0-3-7.ec2.internal


### Start your Cloudera Manager server -- debug as necessary
[root@ip-10-0-3-7 ~]# service cloudera-scm-server start
Starting cloudera-scm-server:                              [  OK  ]
[root@ip-10-0-3-7 ~]# tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log 

    Do not continue until you can browse your CM instance at port 7180
