# Test HDFS Snapshots

## Create a precious directory in HDFS; copy the ZIP course file into it.
```
[root@ip-10-0-3-7 cloudera-parcel]# sudo -u hdfs hdfs dfs -mkdir /precious
[root@ip-10-0-3-7 ec2-user]# sudo -u hdfs hdfs dfs -chown harshal-yb /precious/
[root@ip-10-0-3-7 ec2-user]# 

harshal@shreeganesh ~/Downloads $ scp -i ~/.ssh/harshal_self.pem /home/harshal/SEBC-master.zip ec2-user@54.86.95.98:/home/ec2-user/ 
SEBC-master.zip                                                                                                                       100%  464KB 463.7KB/s   00:00    
harshal@shreeganesh ~/Downloads $ 

root@ip-10-0-3-7 ec2-user]# su - harshal-yb
[harshal-yb@ip-10-0-3-7 ~]$ hdfs dfs -put /home/harshal-yb/SEBC-master.zip /precious/
[harshal-yb@ip-10-0-3-7 ~]$ 
```
## Enable snapshots for precious
Enabled Snapshot for /precious directory

## Create a snapshot called sebc-hdfs-test
Created snapshot sebc-hdfs-test

## Delete the directory
```
harshal-yb@ip-10-0-3-7 ~]$ hdfs dfs -rm /precious/SEBC-master.zip
17/10/10 18:36:55 INFO fs.TrashPolicyDefault: Moved: 'hdfs://ip-10-0-3-7.ec2.internal:8020/precious/SEBC-master.zip' to trash at: hdfs://ip-10-0-3-7.ec2.internal:8020/user/harshal-yb/.Trash/Current/precious/SEBC-master.zip
[harshal-yb@ip-10-0-3-7 ~]$ hdfs dfs -rmdir /precious/
rmdir: Permission denied: user=harshal-yb, access=WRITE, inode="/":hdfs:supergroup:drwxr-xr-x
[harshal-yb@ip-10-0-3-7 ~]$ hdfs dfs -rmdir /precious
rmdir: Permission denied: user=harshal-yb, access=WRITE, inode="/":hdfs:supergroup:drwxr-xr-x
[harshal-yb@ip-10-0-3-7 ~]$
```
## Restore the deleted file
```
[harshal-yb@ip-10-0-3-7 ~]$ hdfs dfs -ls /precious/
Found 1 items
-rw-r--r--   3 hdfs supergroup     474782 2017-10-10 18:40 /precious/SEBC-master.zip
[harshal-yb@ip-10-0-3-7 ~]$ 
```
