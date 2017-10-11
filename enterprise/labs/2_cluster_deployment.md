```
harshal@shreeganesh ~/SEBC/enterprise/labs $ curl -u harshal-yb:Avaya123 'http://107.23.242.117:7180/api/v2/cm/deployment'
{
  "timestamp" : "2017-10-11T16:01:51.858Z",
  "clusters" : [ {
    "name" : "harshal-yb",
    "version" : "CDH5",
    "services" : [ {
      "name" : "hive",
      "type" : "HIVE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "HIVEMETASTORE",
          "items" : [ {
            "name" : "hive_metastore_java_heapsize",
            "value" : "615514112"
          } ]
        }, {
          "roleType" : "HIVESERVER2",
          "items" : [ {
            "name" : "hiveserver2_java_heapsize",
            "value" : "615514112"
          }, {
            "name" : "hiveserver2_spark_driver_memory",
            "value" : "966367641"
          }, {
            "name" : "hiveserver2_spark_executor_cores",
            "value" : "4"
          }, {
            "name" : "hiveserver2_spark_executor_memory",
            "value" : "2394003865"
          }, {
            "name" : "hiveserver2_spark_yarn_driver_memory_overhead",
            "value" : "102"
          }, {
            "name" : "hiveserver2_spark_yarn_executor_memory_overhead",
            "value" : "402"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_metastore_database_host",
          "value" : "ip-10-0-3-7.ec2.internal"
        }, {
          "name" : "hive_metastore_database_name",
          "value" : "hive"
        }, {
          "name" : "hive_metastore_database_password",
          "value" : "hive_password"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hive-GATEWAY-056450e6fd525fa3d007b0f0a89ebca2",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-04f0896b59fb5b670"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-09c0461958681211954eb182d5d277ce",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-4609ddcdc2f7262cddc37f229e594d9d",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-0ee82f2fb21dd833e"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-755d30793a9863a837eacfb8be7d1418",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-GATEWAY-c2430e18c16445a87ec80a03b8313a2f",
        "type" : "GATEWAY",
        "hostRef" : {
          "hostId" : "i-0b22a300d36a167b7"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hive-HIVEMETASTORE-755d30793a9863a837eacfb8be7d1418",
        "type" : "HIVEMETASTORE",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "3nhl8wsis4qwtx49pdidlsatr"
          } ]
        }
      }, {
        "name" : "hive-HIVESERVER2-755d30793a9863a837eacfb8be7d1418",
        "type" : "HIVESERVER2",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "34zr08dwy9yae9nppr61yifso"
          } ]
        }
      } ],
      "displayName" : "Hive"
    }, {
      "name" : "zookeeper",
      "type" : "ZOOKEEPER",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "SERVER",
          "items" : [ {
            "name" : "zookeeper_server_java_heapsize",
            "value" : "615514112"
          } ]
        } ],
        "items" : [ ]
      },
      "roles" : [ {
        "name" : "zookeeper-SERVER-056450e6fd525fa3d007b0f0a89ebca2",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-04f0896b59fb5b670"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "38fyefsm1z92t03hb1b07ts7g"
          }, {
            "name" : "serverId",
            "value" : "1"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-09c0461958681211954eb182d5d277ce",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "6l3228h58onx741xyli7xlo92"
          }, {
            "name" : "serverId",
            "value" : "2"
          } ]
        }
      }, {
        "name" : "zookeeper-SERVER-755d30793a9863a837eacfb8be7d1418",
        "type" : "SERVER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "40w73urvo73lok0dc6yr0mypa"
          }, {
            "name" : "serverId",
            "value" : "3"
          } ]
        }
      } ],
      "displayName" : "ZooKeeper"
    }, {
      "name" : "hue",
      "type" : "HUE",
      "config" : {
        "roleTypeConfigs" : [ ],
        "items" : [ {
          "name" : "database_host",
          "value" : "ip-10-0-3-7.ec2.internal"
        }, {
          "name" : "database_password",
          "value" : "hue_password"
        }, {
          "name" : "database_type",
          "value" : "mysql"
        }, {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "hue_webhdfs",
          "value" : "hdfs-NAMENODE-755d30793a9863a837eacfb8be7d1418"
        }, {
          "name" : "oozie_service",
          "value" : "oozie"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hue-HUE_SERVER-755d30793a9863a837eacfb8be7d1418",
        "type" : "HUE_SERVER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c7f5klvyi5hifxqtxtikweqkc"
          }, {
            "name" : "secret_key",
            "value" : "DDT2MMFziDz2DJpFeOUBVtKkO2RAUS"
          } ]
        }
      } ],
      "displayName" : "Hue"
    }, {
      "name" : "oozie",
      "type" : "OOZIE",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "OOZIE_SERVER",
          "items" : [ {
            "name" : "oozie_database_host",
            "value" : "ip-10-0-3-7.ec2.internal"
          }, {
            "name" : "oozie_database_password",
            "value" : "oozie_password"
          }, {
            "name" : "oozie_database_type",
            "value" : "mysql"
          }, {
            "name" : "oozie_database_user",
            "value" : "oozie"
          }, {
            "name" : "oozie_java_heapsize",
            "value" : "615514112"
          } ]
        } ],
        "items" : [ {
          "name" : "hive_service",
          "value" : "hive"
        }, {
          "name" : "mapreduce_yarn_service",
          "value" : "yarn"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "oozie-OOZIE_SERVER-755d30793a9863a837eacfb8be7d1418",
        "type" : "OOZIE_SERVER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c0pltlszb88vvxekiwkgq36lq"
          } ]
        }
      } ],
      "displayName" : "Oozie"
    }, {
      "name" : "yarn",
      "type" : "YARN",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "mapred_reduce_tasks",
            "value" : "8"
          }, {
            "name" : "mapred_submit_replication",
            "value" : "2"
          } ]
        }, {
          "roleType" : "JOBHISTORY",
          "items" : [ {
            "name" : "mr2_jobhistory_java_heapsize",
            "value" : "615514112"
          } ]
        }, {
          "roleType" : "NODEMANAGER",
          "items" : [ {
            "name" : "rm_cpu_shares",
            "value" : "1600"
          }, {
            "name" : "rm_io_weight",
            "value" : "800"
          }, {
            "name" : "yarn_nodemanager_heartbeat_interval_ms",
            "value" : "100"
          }, {
            "name" : "yarn_nodemanager_local_dirs",
            "value" : "/yarn/nm"
          }, {
            "name" : "yarn_nodemanager_log_dirs",
            "value" : "/yarn/container-logs"
          }, {
            "name" : "yarn_nodemanager_resource_cpu_vcores",
            "value" : "3"
          }, {
            "name" : "yarn_nodemanager_resource_memory_mb",
            "value" : "5295"
          } ]
        }, {
          "roleType" : "RESOURCEMANAGER",
          "items" : [ {
            "name" : "resource_manager_java_heapsize",
            "value" : "615514112"
          }, {
            "name" : "yarn_scheduler_maximum_allocation_mb",
            "value" : "5295"
          }, {
            "name" : "yarn_scheduler_maximum_allocation_vcores",
            "value" : "3"
          } ]
        } ],
        "items" : [ {
          "name" : "hdfs_service",
          "value" : "hdfs"
        }, {
          "name" : "rm_dirty",
          "value" : "false"
        }, {
          "name" : "rm_last_allocation_percentage",
          "value" : "80"
        }, {
          "name" : "yarn_service_cgroups",
          "value" : "false"
        }, {
          "name" : "yarn_service_lce_always",
          "value" : "false"
        }, {
          "name" : "zk_authorization_secret_key",
          "value" : "bkl8BmWGIbXknwNRiJwKG1YKyYimNg"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "yarn-JOBHISTORY-755d30793a9863a837eacfb8be7d1418",
        "type" : "JOBHISTORY",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "c7yeteifq7x3r7d22jto1ggnc"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-056450e6fd525fa3d007b0f0a89ebca2",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-04f0896b59fb5b670"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "9ol0vz9ts588o3gw9r2oqglve"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-09c0461958681211954eb182d5d277ce",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "7j94za786pazn982xcirmjjlo"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-4609ddcdc2f7262cddc37f229e594d9d",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-0ee82f2fb21dd833e"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "da3kbao701eru41t9rk5w2vda"
          } ]
        }
      }, {
        "name" : "yarn-NODEMANAGER-c2430e18c16445a87ec80a03b8313a2f",
        "type" : "NODEMANAGER",
        "hostRef" : {
          "hostId" : "i-0b22a300d36a167b7"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "bgncx9wnbbtfg81j2j8nvnm75"
          } ]
        }
      }, {
        "name" : "yarn-RESOURCEMANAGER-755d30793a9863a837eacfb8be7d1418",
        "type" : "RESOURCEMANAGER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "rm_id",
            "value" : "55"
          }, {
            "name" : "role_jceks_password",
            "value" : "app0ffrs1d98z1w22tet02hga"
          } ]
        }
      } ],
      "displayName" : "YARN (MR2 Included)"
    }, {
      "name" : "hdfs",
      "type" : "HDFS",
      "config" : {
        "roleTypeConfigs" : [ {
          "roleType" : "BALANCER",
          "items" : [ {
            "name" : "balancer_java_heapsize",
            "value" : "615514112"
          } ]
        }, {
          "roleType" : "DATANODE",
          "items" : [ {
            "name" : "datanode_java_heapsize",
            "value" : "1073741824"
          }, {
            "name" : "dfs_data_dir_list",
            "value" : "/dfs/dn1"
          }, {
            "name" : "dfs_datanode_du_reserved",
            "value" : "3157155020"
          }, {
            "name" : "dfs_datanode_max_locked_memory",
            "value" : "4294967296"
          }, {
            "name" : "rm_cpu_shares",
            "value" : "400"
          }, {
            "name" : "rm_io_weight",
            "value" : "200"
          } ]
        }, {
          "roleType" : "GATEWAY",
          "items" : [ {
            "name" : "dfs_client_use_trash",
            "value" : "true"
          } ]
        }, {
          "roleType" : "JOURNALNODE",
          "items" : [ {
            "name" : "dfs_journalnode_edits_dir",
            "value" : "/dfs/jn"
          } ]
        }, {
          "roleType" : "NAMENODE",
          "items" : [ {
            "name" : "dfs_name_dir_list",
            "value" : "/dfs/nn1"
          }, {
            "name" : "dfs_namenode_servicerpc_address",
            "value" : "8022"
          }, {
            "name" : "namenode_java_heapsize",
            "value" : "615514112"
          } ]
        }, {
          "roleType" : "SECONDARYNAMENODE",
          "items" : [ {
            "name" : "fs_checkpoint_dir_list",
            "value" : "/dfs/snn1"
          }, {
            "name" : "secondary_namenode_java_heapsize",
            "value" : "615514112"
          } ]
        } ],
        "items" : [ {
          "name" : "dfs_ha_fencing_cloudera_manager_secret_key",
          "value" : "11Y2RCScXx92imluU1sBj5sIL7m76E"
        }, {
          "name" : "dfs_ha_fencing_methods",
          "value" : "shell(true)"
        }, {
          "name" : "fc_authorization_secret_key",
          "value" : "5zG4iwY3RS22HiVAGTgdfINCoPJ0NG"
        }, {
          "name" : "http_auth_signature_secret",
          "value" : "hqHDfWC3hFT1lWTfEqt27ncrqakj4j"
        }, {
          "name" : "rm_dirty",
          "value" : "false"
        }, {
          "name" : "rm_last_allocation_percentage",
          "value" : "20"
        }, {
          "name" : "zookeeper_service",
          "value" : "zookeeper"
        } ]
      },
      "roles" : [ {
        "name" : "hdfs-BALANCER-755d30793a9863a837eacfb8be7d1418",
        "type" : "BALANCER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ ]
        }
      }, {
        "name" : "hdfs-DATANODE-056450e6fd525fa3d007b0f0a89ebca2",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-04f0896b59fb5b670"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "efyaffbwa3v3r6lzmw0xob0id"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-09c0461958681211954eb182d5d277ce",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "6xhpvugrsws6e92w0tnexct05"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-4609ddcdc2f7262cddc37f229e594d9d",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-0ee82f2fb21dd833e"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "5e5pxqve46n23yhxasyio8qiy"
          } ]
        }
      }, {
        "name" : "hdfs-DATANODE-c2430e18c16445a87ec80a03b8313a2f",
        "type" : "DATANODE",
        "hostRef" : {
          "hostId" : "i-0b22a300d36a167b7"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "b6yhfbxzi153xcdsod4i01r4v"
          } ]
        }
      }, {
        "name" : "hdfs-FAILOVERCONTROLLER-09c0461958681211954eb182d5d277ce",
        "type" : "FAILOVERCONTROLLER",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "eun1cjn6t2g2bv8b1rgnkxseh"
          } ]
        }
      }, {
        "name" : "hdfs-FAILOVERCONTROLLER-755d30793a9863a837eacfb8be7d1418",
        "type" : "FAILOVERCONTROLLER",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "amx09yb1pd6xyvhsay3nggecu"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-056450e6fd525fa3d007b0f0a89ebca2",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-04f0896b59fb5b670"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "6r8zw6c9i813ofqq6ze7i2xku"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-09c0461958681211954eb182d5d277ce",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "gnh11fm8y6ytszvro46a7r86"
          } ]
        }
      }, {
        "name" : "hdfs-JOURNALNODE-755d30793a9863a837eacfb8be7d1418",
        "type" : "JOURNALNODE",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "role_jceks_password",
            "value" : "9zg6kr54ak2e1lsu72zp8l7vi"
          } ]
        }
      }, {
        "name" : "hdfs-NAMENODE-09c0461958681211954eb182d5d277ce",
        "type" : "NAMENODE",
        "hostRef" : {
          "hostId" : "i-08efb259da6e0d2c6"
        },
        "config" : {
          "items" : [ {
            "name" : "autofailover_enabled",
            "value" : "true"
          }, {
            "name" : "dfs_federation_namenode_nameservice",
            "value" : "nameservice1"
          }, {
            "name" : "dfs_namenode_quorum_journal_name",
            "value" : "nameservice1"
          }, {
            "name" : "namenode_id",
            "value" : "63"
          }, {
            "name" : "role_jceks_password",
            "value" : "c2lc9bxm345nvdk8hxs2eszov"
          } ]
        }
      }, {
        "name" : "hdfs-NAMENODE-755d30793a9863a837eacfb8be7d1418",
        "type" : "NAMENODE",
        "hostRef" : {
          "hostId" : "i-0a728ab3dc13881c3"
        },
        "config" : {
          "items" : [ {
            "name" : "autofailover_enabled",
            "value" : "true"
          }, {
            "name" : "dfs_federation_namenode_nameservice",
            "value" : "nameservice1"
          }, {
            "name" : "dfs_namenode_quorum_journal_name",
            "value" : "nameservice1"
          }, {
            "name" : "namenode_id",
            "value" : "57"
          }, {
            "name" : "role_jceks_password",
            "value" : "79c5smus2ks4oga7m230m6y4w"
          } ]
        }
      } ],
      "displayName" : "HDFS"
    } ]
  } ],
  "hosts" : [ {
    "hostId" : "i-0ee82f2fb21dd833e",
    "ipAddress" : "10.0.3.235",
    "hostname" : "ip-10-0-3-235.ec2.internal",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-08efb259da6e0d2c6",
    "ipAddress" : "10.0.3.37",
    "hostname" : "ip-10-0-3-37.ec2.internal",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-0a728ab3dc13881c3",
    "ipAddress" : "10.0.3.7",
    "hostname" : "ip-10-0-3-7.ec2.internal",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-04f0896b59fb5b670",
    "ipAddress" : "10.0.3.90",
    "hostname" : "ip-10-0-3-90.ec2.internal",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  }, {
    "hostId" : "i-0b22a300d36a167b7",
    "ipAddress" : "10.0.3.95",
    "hostname" : "ip-10-0-3-95.ec2.internal",
    "rackId" : "/default",
    "config" : {
      "items" : [ ]
    }
  } ],
  "users" : [ {
    "name" : "__cloudera_internal_user__mgmt-ACTIVITYMONITOR-755d30793a9863a837eacfb8be7d1418",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "77c2c2702561d885588e38370c86ba5acdfe229e0a615a50a5c1326c74c3cd26",
    "pwSalt" : 3830584276907572780,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-EVENTSERVER-755d30793a9863a837eacfb8be7d1418",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "e2422b77591da0add8cf1f473141a7206de0f54cf5232efd0fd616fd09eed1f7",
    "pwSalt" : -644359753588322669,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-HOSTMONITOR-755d30793a9863a837eacfb8be7d1418",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "0d7364efd29d04808ccb6ef9872b62d74e0aa4daef9f4be846be95f059391f02",
    "pwSalt" : -7177829395690860680,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-REPORTSMANAGER-755d30793a9863a837eacfb8be7d1418",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "aaa0eace49506523908f5b69ad56d6cb4643857529e4b5a701405adfb43af972",
    "pwSalt" : -3747399695067746454,
    "pwLogin" : true
  }, {
    "name" : "__cloudera_internal_user__mgmt-SERVICEMONITOR-755d30793a9863a837eacfb8be7d1418",
    "roles" : [ "ROLE_USER" ],
    "pwHash" : "eead643b01ccee00efe21d307cd18f0efc5e70993ff59d75dc0dbc3ffa151b5e",
    "pwSalt" : 4929013782436761339,
    "pwLogin" : true
  }, {
    "name" : "admin",
    "roles" : [ "ROLE_LIMITED" ],
    "pwHash" : "0ce748e761e12e35c6a706854c609d3835d7a0b514ffcfc181ad6c346794542e",
    "pwSalt" : 6371303517978964925,
    "pwLogin" : true
  }, {
    "name" : "harshal-yb",
    "roles" : [ "ROLE_ADMIN" ],
    "pwHash" : "99c1c2775246a23863c2b79cb4e1305adcc4f6f82f5266575074022ffeff14e0",
    "pwSalt" : -2717635698119877364,
    "pwLogin" : true
  }, {
    "name" : "minotaur",
    "roles" : [ "ROLE_CONFIGURATOR" ],
    "pwHash" : "40598d2235ba21dcee0a1f9210d99ea6169a9f15fd735ad2b503d74802a9b96e",
    "pwSalt" : 1970169842427723941,
    "pwLogin" : true
  } ],
  "versionInfo" : {
    "version" : "5.9.3",
    "buildUser" : "jenkins",
    "buildTimestamp" : "20170627-1506",
    "gitHash" : "23506bb4e114dd460bdac64c57a672e6be631907",
    "snapshot" : false
  },
  "managementService" : {
    "name" : "mgmt",
    "type" : "MGMT",
    "config" : {
      "roleTypeConfigs" : [ {
        "roleType" : "ACTIVITYMONITOR",
        "items" : [ {
          "name" : "firehose_database_host",
          "value" : "ip-10-0-3-7.ec2.internal"
        }, {
          "name" : "firehose_database_name",
          "value" : "amon"
        }, {
          "name" : "firehose_database_password",
          "value" : "amon_password"
        }, {
          "name" : "firehose_database_user",
          "value" : "amon"
        }, {
          "name" : "firehose_heapsize",
          "value" : "615514112"
        } ]
      }, {
        "roleType" : "EVENTSERVER",
        "items" : [ {
          "name" : "event_server_heapsize",
          "value" : "615514112"
        } ]
      }, {
        "roleType" : "HOSTMONITOR",
        "items" : [ {
          "name" : "firehose_heapsize",
          "value" : "615514112"
        }, {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "805306368"
        } ]
      }, {
        "roleType" : "REPORTSMANAGER",
        "items" : [ {
          "name" : "headlamp_database_host",
          "value" : "ip-10-0-3-7.ec2.internal"
        }, {
          "name" : "headlamp_database_name",
          "value" : "rman"
        }, {
          "name" : "headlamp_database_password",
          "value" : "rman_password"
        }, {
          "name" : "headlamp_database_user",
          "value" : "rman"
        }, {
          "name" : "headlamp_heapsize",
          "value" : "615514112"
        } ]
      }, {
        "roleType" : "SERVICEMONITOR",
        "items" : [ {
          "name" : "firehose_heapsize",
          "value" : "615514112"
        }, {
          "name" : "firehose_non_java_memory_bytes",
          "value" : "805306368"
        } ]
      } ],
      "items" : [ ]
    },
    "roles" : [ {
      "name" : "mgmt-ACTIVITYMONITOR-755d30793a9863a837eacfb8be7d1418",
      "type" : "ACTIVITYMONITOR",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "cd1vncyix369o5tc86qdrcow3"
        } ]
      }
    }, {
      "name" : "mgmt-ALERTPUBLISHER-755d30793a9863a837eacfb8be7d1418",
      "type" : "ALERTPUBLISHER",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "898nnz4lhkyvxzf1t3wuua9fz"
        } ]
      }
    }, {
      "name" : "mgmt-EVENTSERVER-755d30793a9863a837eacfb8be7d1418",
      "type" : "EVENTSERVER",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "kak2k7xprykky2jjf3hbxln6"
        } ]
      }
    }, {
      "name" : "mgmt-HOSTMONITOR-755d30793a9863a837eacfb8be7d1418",
      "type" : "HOSTMONITOR",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "71rjpyb5r3t5cau9c6nar58tq"
        } ]
      }
    }, {
      "name" : "mgmt-REPORTSMANAGER-755d30793a9863a837eacfb8be7d1418",
      "type" : "REPORTSMANAGER",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "524sz9nz9mwz1bu7bhzevo6vc"
        } ]
      }
    }, {
      "name" : "mgmt-SERVICEMONITOR-755d30793a9863a837eacfb8be7d1418",
      "type" : "SERVICEMONITOR",
      "hostRef" : {
        "hostId" : "i-0a728ab3dc13881c3"
      },
      "config" : {
        "items" : [ {
          "name" : "role_jceks_password",
          "value" : "919xyge5n963quludk034ly88"
        } ]
      }
    } ],
    "displayName" : "Cloudera Management Service"
  },
  "managerSettings" : {
    "items" : [ {
      "name" : "CLUSTER_STATS_START",
      "value" : "10/23/2012 12:00"
    }, {
      "name" : "PUBLIC_CLOUD_STATUS",
      "value" : "ON_PUBLIC_CLOUD"
    }, {
      "name" : "REMOTE_PARCEL_REPO_URLS",
      "value" : "https://archive.cloudera.com/cdh5/parcels/{latest_supported}/,https://archive.cloudera.com/cdh4/parcels/latest/,http://54.86.95.98/cloudera-parcel/,https://archive.cloudera.com/impala/parcels/latest/,https://archive.cloudera.com/search/parcels/latest/,https://archive.cloudera.com/accumulo/parcels/1.4/,https://archive.cloudera.com/accumulo-c5/parcels/latest/,https://archive.cloudera.com/kafka/parcels/latest/,https://archive.cloudera.com/navigator-keytrustee5/parcels/latest/,https://archive.cloudera.com/spark/parcels/latest/,https://archive.cloudera.com/sqoop-connectors/parcels/latest/"
    } ]
  }
}harshal@shreeganesh ~/SEBC/enterprise/labs $ 
```
