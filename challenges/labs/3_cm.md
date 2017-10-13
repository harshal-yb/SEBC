## HDFS User Directories
```
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hdfs dfs -mkdir /user/jimenez
[root@ip-10-0-1-78 yum.repos.d]# id jimenez
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hdfs dfs -chown jimenez:rangers /user/jimenez
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hdfs dfs -mkdir /user/beltran
[root@ip-10-0-1-78 yum.repos.d]# id beltran
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hdfs dfs -chown beltran:astros /user/beltran
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hdfs dfs -ls /user
Found 6 items
drwxr-xr-x   - beltran astros           0 2017-10-13 15:29 /user/beltran
drwxrwxrwx   - mapred  hadoop           0 2017-10-13 15:24 /user/history
drwxrwxr-t   - hive    hive             0 2017-10-13 15:24 /user/hive
drwxrwxr-x   - hue     hue              0 2017-10-13 15:25 /user/hue
drwxr-xr-x   - jimenez rangers          0 2017-10-13 15:28 /user/jimenez
drwxrwxr-x   - oozie   oozie            0 2017-10-13 15:25 /user/oozie
[root@ip-10-0-1-78 yum.repos.d]# 
```

## Host list using API

```
harshal@shreeganesh ~/.ssh $ curl -u admin:admin 'http://54.173.79.146:7180/api/v5/hosts'
{
  "items" : [ {
    "hostId" : "d424f044-3cad-4fc3-adca-489964f40c1d",
    "ipAddress" : "10.0.1.175",
    "hostname" : "ip-10-0-1-175.ec2.internal",
    "rackId" : "/default",
    "hostUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/hostRedirect/d424f044-3cad-4fc3-adca-489964f40c1d",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "totalPhysMemBytes" : 15799816192
  }, {
    "hostId" : "dda47d9f-3400-4cbb-97dd-5aa53a18123a",
    "ipAddress" : "10.0.1.182",
    "hostname" : "ip-10-0-1-182.ec2.internal",
    "rackId" : "/default",
    "hostUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/hostRedirect/dda47d9f-3400-4cbb-97dd-5aa53a18123a",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "totalPhysMemBytes" : 15799816192
  }, {
    "hostId" : "5b3f0426-ebf1-494d-81c7-be155d49c77f",
    "ipAddress" : "10.0.1.183",
    "hostname" : "ip-10-0-1-183.ec2.internal",
    "rackId" : "/default",
    "hostUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/hostRedirect/5b3f0426-ebf1-494d-81c7-be155d49c77f",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "totalPhysMemBytes" : 15799816192
  }, {
    "hostId" : "fe51320d-16e6-48d4-8302-a7312a0d6985",
    "ipAddress" : "10.0.1.65",
    "hostname" : "ip-10-0-1-65.ec2.internal",
    "rackId" : "/default",
    "hostUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/hostRedirect/fe51320d-16e6-48d4-8302-a7312a0d6985",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "totalPhysMemBytes" : 15799816192
  }, {
    "hostId" : "8ac05be8-8ece-43f4-8ae8-486270afeffc",
    "ipAddress" : "10.0.1.78",
    "hostname" : "ip-10-0-1-78.ec2.internal",
    "rackId" : "/default",
    "hostUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/hostRedirect/8ac05be8-8ece-43f4-8ae8-486270afeffc",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "commissionState" : "COMMISSIONED",
    "numCores" : 4,
    "totalPhysMemBytes" : 15799816192
  } ]
}harshal@shreeganesh ~/.ssh $ 

## Cluster Services using API
```
harshal@shreeganesh ~/.ssh $ curl -u admin:admin 'http://54.173.79.146:7180/api/v11/clusters/harshal-yb/services'
{
  "items" : [ {
    "name" : "zookeeper",
    "type" : "ZOOKEEPER",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/zookeeper",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/zookeeper/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "ZOOKEEPER_CANARY_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "ZOOKEEPER_SERVERS_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "ZooKeeper",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "oozie",
    "type" : "OOZIE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/oozie",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/oozie/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "OOZIE_OOZIE_SERVERS_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Oozie",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "hue",
    "type" : "HUE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hue",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hue/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HUE_HUE_SERVERS_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HUE_LOAD_BALANCER_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Hue",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "hdfs",
    "type" : "HDFS",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hdfs",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hdfs/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HDFS_BLOCKS_WITH_CORRUPT_REPLICAS",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_CANARY_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_DATA_NODES_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_FREE_SPACE_REMAINING",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_HA_NAMENODE_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_MISSING_BLOCKS",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HDFS_UNDER_REPLICATED_BLOCKS",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "HDFS",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "yarn",
    "type" : "YARN",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/yarn",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/yarn/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "YARN_JOBHISTORY_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "YARN_NODE_MANAGERS_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "YARN_RESOURCEMANAGERS_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "YARN_USAGE_AGGREGATION_HEALTH",
      "summary" : "DISABLED",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "YARN (MR2 Included)",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "hbase",
    "type" : "HBASE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hbase",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hbase/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HBASE_MASTER_HEALTH",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HBASE_REGION_SERVERS_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "HBase",
    "entityStatus" : "GOOD_HEALTH"
  }, {
    "name" : "hive",
    "type" : "HIVE",
    "clusterRef" : {
      "clusterName" : "cluster"
    },
    "serviceUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hive",
    "roleInstancesUrl" : "http://ip-10-0-1-78.ec2.internal:7180/cmf/serviceRedirect/hive/instances",
    "serviceState" : "STARTED",
    "healthSummary" : "GOOD",
    "healthChecks" : [ {
      "name" : "HIVE_HIVEMETASTORES_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    }, {
      "name" : "HIVE_HIVESERVER2S_HEALTHY",
      "summary" : "GOOD",
      "suppressed" : false
    } ],
    "configStalenessStatus" : "FRESH",
    "clientConfigStalenessStatus" : "FRESH",
    "maintenanceMode" : false,
    "maintenanceOwners" : [ ],
    "displayName" : "Hive",
    "entityStatus" : "GOOD_HEALTH"
  } ]
}harshal@shreeganesh ~/.ssh $ 

```
```
