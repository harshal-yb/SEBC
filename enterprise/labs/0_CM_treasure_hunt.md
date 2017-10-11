## What is ubertask optimization?
The ubertask optimization enables small enogh job to run in a single JVM. 

This is defined by following parameter which enables this feature and defines what is treated as ubertask

Enable Ubertask Optimization 	mapreduce.job.ubertask.enable

What can be treated as Small Job is defined by following parameter

Ubertask Maximum Maps		mapreduce.job.ubertask.maxmaps
Ubertask Maximum Reduces	mapreduce.job.ubertask.maxreduces
Ubertask Maximum Job Size	mapreduce.job.ubertask.maxbytes


## Where in CM is the Kerberos Security Realm value displayed?

It is displayed in Cloudera Manager --> Administration --> Settings --> kerberos --> Kerberos Security Realm

## Which CDH service(s) host a property for enabling Kerberos authentication?

Zookeeper, YARN and HDFS services hosts property to enable kerberos authentication.

## How do you upgrade the CM agents?

Cloudera Manager --> Hosts --> All Hosts --> Re-run Upgrade Wizard

## Give the tsquery statement used to chart Hue's CPU utilization?

SELECT cpu_system_rate + cpu_user_rate WHERE entityName = "hue-HUE_SERVER-755d30793a9863a837eacfb8be7d1418" AND category = ROLE

## Name all the roles that make up the Hive service

Following are the roles in Hive Service 
1. Hive Metastore server
2. Hiveserver2
3. gateway(s)

## What steps must be completed before integrating Cloudera Manager with Kerberos?
Following are the steps completed before integrating CM with Kerberos

1. KDC must be set up and ready ... (CM support MIT KDC and Active Directory)
2. KDS should allow ticket renewal time and ticket lifetime more than zero
3. Kerberos client libraries should be install on all the nodes
4. A kerberos account must exists which had permission to create other accouts in KDC.



