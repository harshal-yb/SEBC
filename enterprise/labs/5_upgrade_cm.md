# Upgrade Java
Upgraded java version to 1.8

[root@ip-10-0-3-7 ~]# ll
total 169392
-rw-r--r--. 1 root root       130 Oct  9 20:59 host_fqdn
-rw-r--r--  1 root root        50 Oct 10 15:00 hosts
-rw-r--r--. 1 root root 169971490 Jul 24 21:30 jdk-8u144-linux-x64.rpm
drwxr-xr-x. 3 root root      4096 Aug 29 02:13 mysql-connector-java-5.1.44
-rw-r--r--. 1 root root   3465760 Aug 29 00:13 mysql-connector-java-5.1.44.tar.gz
-rw-r--r--. 1 root root       185 Oct  9 23:01 mysql-tools.repo
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; scp jdk-8u144-linux-x64.rpm $i:/root/;done
10.0.3.7
jdk-8u144-linux-x64.rpm                                                                                                               100%  162MB  81.1MB/s   00:02    
10.0.3.37
jdk-8u144-linux-x64.rpm                                                                                                               100%  162MB 162.1MB/s   00:01    
10.0.3.90
jdk-8u144-linux-x64.rpm                                                                                                               100%  162MB 162.1MB/s   00:01    
10.0.3.95
jdk-8u144-linux-x64.rpm                                                                                                               100%  162MB 162.1MB/s   00:01    
10.0.3.235
jdk-8u144-linux-x64.rpm                                                                                                               100%  162MB  81.1MB/s   00:02    
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "yum -y install /root/jdk-8u144-linux-x64.rpm";done
10.0.3.7
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Examining /root/jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
/root/jdk-8u144-linux-x64.rpm: does not update installed package.
Error: Nothing to do
10.0.3.37
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Repository mysql-tools-preview is listed more than once in the configuration
Repository mysql-tools-preview is listed more than once in the configuration
Setting up Install Process
Examining /root/jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
Marking /root/jdk-8u144-linux-x64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch      Version                Repository               Size
================================================================================
Installing:
 jdk1.8.0_144    x86_64    2000:1.8.0_144-fcs     /jdk-8u144-linux-x64    269 M

Transaction Summary
================================================================================
Install       1 Package(s)

Total size: 269 M
Installed size: 269 M
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 
Unpacking JAR files...
	tools.jar...
	plugin.jar...
	javaws.jar...
	deploy.jar...
	rt.jar...
	jsse.jar...
	charsets.jar...
	localedata.jar...
  Verifying  : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 

Installed:
  jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs                                        

Complete!
10.0.3.90
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Repository mysql-tools-preview is listed more than once in the configuration
Repository mysql-tools-preview is listed more than once in the configuration
Setting up Install Process
Examining /root/jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
Marking /root/jdk-8u144-linux-x64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch      Version                Repository               Size
================================================================================
Installing:
 jdk1.8.0_144    x86_64    2000:1.8.0_144-fcs     /jdk-8u144-linux-x64    269 M

Transaction Summary
================================================================================
Install       1 Package(s)

Total size: 269 M
Installed size: 269 M
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 
Unpacking JAR files...
	tools.jar...
	plugin.jar...
	javaws.jar...
	deploy.jar...
	rt.jar...
	jsse.jar...
	charsets.jar...
	localedata.jar...
  Verifying  : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 

Installed:
  jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs                                        

Complete!
10.0.3.95
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Repository mysql-tools-preview is listed more than once in the configuration
Setting up Install Process
Examining /root/jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
Marking /root/jdk-8u144-linux-x64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch      Version                Repository               Size
================================================================================
Installing:
 jdk1.8.0_144    x86_64    2000:1.8.0_144-fcs     /jdk-8u144-linux-x64    269 M

Transaction Summary
================================================================================
Install       1 Package(s)

Total size: 269 M
Installed size: 269 M
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 
Unpacking JAR files...
	tools.jar...
	plugin.jar...
	javaws.jar...
	deploy.jar...
	rt.jar...
	jsse.jar...
	charsets.jar...
	localedata.jar...
  Verifying  : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 

Installed:
  jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs                                        

Complete!
10.0.3.235
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Repository mysql-tools-preview is listed more than once in the configuration
Repository mysql-tools-preview is listed more than once in the configuration
Setting up Install Process
Examining /root/jdk-8u144-linux-x64.rpm: 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64
Marking /root/jdk-8u144-linux-x64.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch      Version                Repository               Size
================================================================================
Installing:
 jdk1.8.0_144    x86_64    2000:1.8.0_144-fcs     /jdk-8u144-linux-x64    269 M

Transaction Summary
================================================================================
Install       1 Package(s)

Total size: 269 M
Installed size: 269 M
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 
Unpacking JAR files...
	tools.jar...
	plugin.jar...
	javaws.jar...
	deploy.jar...
	rt.jar...
	jsse.jar...
	charsets.jar...
	localedata.jar...
  Verifying  : 2000:jdk1.8.0_144-1.8.0_144-fcs.x86_64                       1/1 

Installed:
  jdk1.8.0_144.x86_64 2000:1.8.0_144-fcs                                        

Complete!

[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "ls -l /usr/java/latest";done
10.0.3.7
lrwxrwxrwx. 1 root root 22 Oct  9 22:24 /usr/java/latest -> /usr/java/jdk1.8.0_144
10.0.3.37
lrwxrwxrwx 1 root root 22 Oct 11 17:43 /usr/java/latest -> /usr/java/jdk1.8.0_144
10.0.3.90
lrwxrwxrwx 1 root root 22 Oct 11 17:43 /usr/java/latest -> /usr/java/jdk1.8.0_144
10.0.3.95
lrwxrwxrwx 1 root root 22 Oct 11 17:43 /usr/java/latest -> /usr/java/jdk1.8.0_144
10.0.3.235
lrwxrwxrwx 1 root root 22 Oct 11 17:43 /usr/java/latest -> /usr/java/jdk1.8.0_144

## After installing Java update cloudera manager server file to use new Java

[root@ip-10-0-3-7 ~]# vi /etc/default/cloudera-scm-server 
export JAVA_HOME="/usr/java/latest/jre/"

## Restart Cloudera-scm-server service

[root@ip-10-0-3-7 ~]# service cloudera-scm-server restart
Stopping cloudera-scm-server:                              [  OK  ]
Starting cloudera-scm-server:                              [  OK  ]
[root@ip-10-0-3-7 ~]#

## Update Java Home for all the Host agents

Hosts --> All Hosts --> Configuration --> Advanced --> Java Home Directory --> Update /usr/java/latest


## Restart agents on all the nodes

[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "service cloudera-scm-agent restart";done
10.0.3.7
Stopping cloudera-scm-agent: [  OK  ]
Starting cloudera-scm-agent: [  OK  ]
10.0.3.37
Stopping cloudera-scm-agent: [  OK  ]
Starting cloudera-scm-agent: [  OK  ]
10.0.3.90
Stopping cloudera-scm-agent: [  OK  ]
Starting cloudera-scm-agent: [  OK  ]
10.0.3.95
Stopping cloudera-scm-agent: [  OK  ]
Starting cloudera-scm-agent: [  OK  ]
10.0.3.235
Stopping cloudera-scm-agent: [  OK  ]
Starting cloudera-scm-agent: [  OK  ]
[root@ip-10-0-3-7 ~]#

## Backup the Cloudera Manager Database

[root@ip-10-0-3-7 ~]# mysqldump -u root -p scm > scm.sql
Enter password: 
[root@ip-10-0-3-7 ~]# ll
total 203604
-rw-r--r--. 1 root root       130 Oct  9 20:59 host_fqdn
-rw-r--r--  1 root root        50 Oct 10 15:00 hosts
-rw-r--r--. 1 root root 169971490 Oct 11 17:41 jdk-8u144-linux-x64.rpm
drwxr-xr-x. 3 root root      4096 Aug 29 02:13 mysql-connector-java-5.1.44
-rw-r--r--. 1 root root   3465760 Aug 29 00:13 mysql-connector-java-5.1.44.tar.gz
-rw-r--r--. 1 root root       185 Oct  9 23:01 mysql-tools.repo
-rw-r--r--  1 root root  35031784 Oct 11 17:58 scm.sql
[root@ip-10-0-3-7 ~]#

## Update CM repo to use latest version
[root@ip-10-0-3-7 ~]# vi /etc/yum.repos.d/cloudera-manager.repo

baseurl = https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/5/

## Stop Cloudera manager server and agent
[root@ip-10-0-3-7 ~]# service cloudera-scm-server stop
Stopping cloudera-scm-server:                              [  OK  ]
[root@ip-10-0-3-7 ~]# service cloudera-scm-agent stop
Stopping cloudera-scm-agent:                               [  OK  ]
[root@ip-10-0-3-7 ~]# 

## Upgrade CM rom

[root@ip-10-0-3-7 ~]# yum clean all
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Cleaning repos: cloudera-manager mysql-connectors-community mysql-tools-community mysql-tools-preview mysql55-community rhui-REGION-client-config-server-6
              : rhui-REGION-rhel-server-releases rhui-REGION-rhel-server-rh-common
Cleaning up Everything
[root@ip-10-0-3-7 ~]# yum upgrade cloudera-manager-server cloudera-manager-daemons cloudera-manager-agent
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Upgrade Process
cloudera-manager                                                                                                                                 |  951 B     00:00     
cloudera-manager/primary                                                                                                                         | 4.3 kB     00:00     
cloudera-manager                                                                                                                                                    7/7
mysql-connectors-community                                                                                                                       | 2.5 kB     00:00     
mysql-connectors-community/primary_db                                                                                                            |  17 kB     00:00     
mysql-tools-community                                                                                                                            | 2.5 kB     00:00     
mysql-tools-community/primary_db                                                                                                                 |  37 kB     00:00     
mysql-tools-preview                                                                                                                              | 2.4 kB     00:00     
mysql-tools-preview/primary_db                                                                                                                   | 6.0 kB     00:00     
mysql55-community                                                                                                                                | 2.5 kB     00:00     
mysql55-community/primary_db                                                                                                                     | 182 kB     00:00     
rhui-REGION-client-config-server-6                                                                                                               | 2.9 kB     00:00     
rhui-REGION-client-config-server-6/primary_db                                                                                                    | 7.0 kB     00:00     
rhui-REGION-rhel-server-releases                                                                                                                 | 3.5 kB     00:00     
rhui-REGION-rhel-server-releases/primary_db                                                                                                      |  59 MB     00:01     
rhui-REGION-rhel-server-rh-common                                                                                                                | 3.8 kB     00:00     
rhui-REGION-rhel-server-rh-common/primary_db                                                                                                     |  65 kB     00:00     
Resolving Dependencies
--> Running transaction check
---> Package cloudera-manager-agent.x86_64 0:5.9.3-1.cm593.p0.6.el6 will be updated
---> Package cloudera-manager-agent.x86_64 0:5.13.0-1.cm5130.p0.55.el6 will be an update
cloudera-manager/filelists                                                                                                                       | 126 kB     00:00     
mysql-connectors-community/filelists_db                                                                                                          |  20 kB     00:00     
mysql-tools-community/filelists_db                                                                                                               |  97 kB     00:00     
mysql-tools-preview/filelists_db                                                                                                                 |  12 kB     00:00     
mysql55-community/filelists_db                                                                                                                   | 316 kB     00:00     
rhui-REGION-client-config-server-6/filelists_db                                                                                                  | 2.9 kB     00:00     
rhui-REGION-rhel-server-releases/filelists_db                                                                                                    |  46 MB     00:00     
rhui-REGION-rhel-server-rh-common/filelists_db                                                                                                   |  79 kB     00:00     
---> Package cloudera-manager-daemons.x86_64 0:5.9.3-1.cm593.p0.6.el6 will be updated
---> Package cloudera-manager-daemons.x86_64 0:5.13.0-1.cm5130.p0.55.el6 will be an update
---> Package cloudera-manager-server.x86_64 0:5.9.3-1.cm593.p0.6.el6 will be updated
---> Package cloudera-manager-server.x86_64 0:5.13.0-1.cm5130.p0.55.el6 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                                       Arch                        Version                                          Repository                             Size
========================================================================================================================================================================
Updating:
 cloudera-manager-agent                        x86_64                      5.13.0-1.cm5130.p0.55.el6                        cloudera-manager                      9.2 M
 cloudera-manager-daemons                      x86_64                      5.13.0-1.cm5130.p0.55.el6                        cloudera-manager                      687 M
 cloudera-manager-server                       x86_64                      5.13.0-1.cm5130.p0.55.el6                        cloudera-manager                      8.5 k

Transaction Summary
========================================================================================================================================================================
Upgrade       3 Package(s)

Total download size: 696 M
Is this ok [y/N]: y
Downloading Packages:
(1/3): cloudera-manager-agent-5.13.0-1.cm5130.p0.55.el6.x86_64.rpm                                                                               | 9.2 MB     00:00     
(2/3): cloudera-manager-daemons-5.13.0-1.cm5130.p0.55.el6.x86_64.rpm                                                                             | 687 MB     00:09     
(3/3): cloudera-manager-server-5.13.0-1.cm5130.p0.55.el6.x86_64.rpm                                                                              | 8.5 kB     00:00     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                    76 MB/s | 696 MB     00:09     
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Updating   : cloudera-manager-daemons-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                            1/6 
  Updating   : cloudera-manager-server-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                             2/6 
  Updating   : cloudera-manager-agent-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                              3/6 
warning: /etc/cloudera-scm-agent/config.ini created as /etc/cloudera-scm-agent/config.ini.rpmnew
  Cleanup    : cloudera-manager-agent-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                 4/6 
  Cleanup    : cloudera-manager-server-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                5/6 
  Cleanup    : cloudera-manager-daemons-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                               6/6 
  Verifying  : cloudera-manager-server-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                             1/6 
  Verifying  : cloudera-manager-agent-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                              2/6 
  Verifying  : cloudera-manager-daemons-5.13.0-1.cm5130.p0.55.el6.x86_64                                                                                            3/6 
  Verifying  : cloudera-manager-agent-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                 4/6 
  Verifying  : cloudera-manager-daemons-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                               5/6 
  Verifying  : cloudera-manager-server-5.9.3-1.cm593.p0.6.el6.x86_64                                                                                                6/6 

Updated:
  cloudera-manager-agent.x86_64 0:5.13.0-1.cm5130.p0.55.el6                          cloudera-manager-daemons.x86_64 0:5.13.0-1.cm5130.p0.55.el6                        
  cloudera-manager-server.x86_64 0:5.13.0-1.cm5130.p0.55.el6                        

Complete!
You have new mail in /var/spool/mail/root
[root@ip-10-0-3-7 ~]# 

## STart the cloudera manager servr
[root@ip-10-0-3-7 ~]# service cloudera-scm-server start
Starting cloudera-scm-server:                              [  OK  ]
[root@ip-10-0-3-7 ~]# tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log

## Upgrade Cloudera managment agent
Login to CM and option will be presented to upgrade agents

## API Version
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/version'
v18
harshal@shreeganesh ~/SEBC/enterprise/labs $ 

## CM Version

harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v1/cm/version' | jq '.version'
"5.13.0"
harshal@shreeganesh ~/SEBC/enterprise/labs $ 

## CM USers

harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v12/users'
{
  "items" : [ {
    "name" : "admin",
    "roles" : [ "ROLE_LIMITED" ]
  }, {
    "name" : "harshal-yb",
    "roles" : [ "ROLE_ADMIN" ]
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ]
  } ]
}harshal@shreeganesh ~/SEBC/enterprise/labs $ 

## CM Database server Type
harshal@shreeganesh ~/SEBC/enterprise/labs $ /usr/bin/curl -s -X GET -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v14/cm/scmDbInfo' | jq '.scmDbType'
"MYSQL"
harshal@shreeganesh ~/SEBC/enterprise/labs $ 



## CDH Upgrade

CM --> Hosts --> Parcles --> CDH5 --> 5.13.0-1.cdh5.13.0.p0.29 --> Download --> Distribute --> Activate --> upgrade (Follow upgrade wizard)




