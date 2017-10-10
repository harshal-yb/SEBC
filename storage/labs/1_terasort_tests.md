# Create an end-user Linux account named with your GitHub handle

## Make sure this Linux account is added to all cluster nodes
///
[root@ip-10-0-3-7 cloudera-parcel]# for i in `cat ~/hosts`; do echo $i; ssh $i "useradd harshal-yb";done
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-7 cloudera-parcel]# for i in `cat ~/hosts`; do echo $i; ssh $i "id harshal-yb";done
10.0.3.7
uid=501(harshal-yb) gid=501(harshal-yb) groups=501(harshal-yb)
10.0.3.37
uid=501(harshal-yb) gid=501(harshal-yb) groups=501(harshal-yb)
10.0.3.90
uid=501(harshal-yb) gid=501(harshal-yb) groups=501(harshal-yb)
10.0.3.95
uid=501(harshal-yb) gid=501(harshal-yb) groups=501(harshal-yb)
10.0.3.235
uid=501(harshal-yb) gid=501(harshal-yb) groups=501(harshal-yb)
[root@ip-10-0-3-7 cloudera-parcel]# for i in `cat ~/hosts`; do echo $i; ssh $i "passwd harshal-yb";done
10.0.3.7
New password: AVaya123
Retype new password: Avaya123
Sorry, passwords do not match.
New password: Avaya123
Retype new password: Avaya123
Changing password for user harshal-yb.
passwd: all authentication tokens updated successfully.
10.0.3.37
New password: Avaya123
Retype new password: Avaya123
Changing password for user harshal-yb.
passwd: all authentication tokens updated successfully.
10.0.3.90
New password: Avaya123
Retype new password: Avaya123
Changing password for user harshal-yb.
passwd: all authentication tokens updated successfully.
10.0.3.95
New password: Avaya123
Retype new password: Avaya123
Changing password for user harshal-yb.
passwd: all authentication tokens updated successfully.
10.0.3.235
New password: Avaya123
Retype new password: AVaya123
Sorry, passwords do not match.
New password: AVaya123
Retype new password: Avaya123
Sorry, passwords do not match.
New password: Avaya123
Retype new password: Avaya123
Changing password for user harshal-yb.
passwd: all authentication tokens updated successfully.
[root@ip-10-0-3-7 cloudera-parcel]# 

///
## Create an HDFS directory under /user
[root@ip-10-0-3-7 cloudera-parcel]# hdfs dfs -ls /
Found 2 items
drwxrwxrwt   - hdfs supergroup          0 2017-10-10 16:05 /tmp
drwxr-xr-x   - hdfs supergroup          0 2017-10-10 16:05 /user
[root@ip-10-0-3-7 cloudera-parcel]# hdfs dfs -ls /user/
Found 4 items
drwxrwxrwx   - mapred hadoop          0 2017-10-10 16:04 /user/history
drwxrwxr-t   - hive   hive            0 2017-10-10 16:04 /user/hive
drwxrwxr-x   - hue    hue             0 2017-10-10 16:05 /user/hue
drwxrwxr-x   - oozie  oozie           0 2017-10-10 16:05 /user/oozie
[root@ip-10-0-3-7 cloudera-parcel]# hdfs dfs -mkdir /user/harshal-yb
mkdir: Permission denied: user=root, access=WRITE, inode="/user":hdfs:supergroup:drwxr-xr-x
[root@ip-10-0-3-7 cloudera-parcel]# sudo -u hdfs hdfs dfs -mkdir /user/harshal-yb
[root@ip-10-0-3-7 cloudera-parcel]# sudo -u hdfs hdfs dfs -chown harshal-yb /user/harshal-yb
[root@ip-10-0-3-7 cloudera-parcel]# hdfs dfs -ls /user/
Found 5 items
drwxr-xr-x   - harshal-yb supergroup          0 2017-10-10 16:41 /user/harshal-yb
drwxrwxrwx   - mapred     hadoop              0 2017-10-10 16:04 /user/history
drwxrwxr-t   - hive       hive                0 2017-10-10 16:04 /user/hive
drwxrwxr-x   - hue        hue                 0 2017-10-10 16:05 /user/hue
drwxrwxr-x   - oozie      oozie               0 2017-10-10 16:05 /user/oozie
[root@ip-10-0-3-7 cloudera-parcel]# 


# Run the following exercises under this user account

## Create a 10 GB file using teragen
### Set the number of mappers to four
-D mapreduce.job.maps 4
### Limit the block size to 32 MB
 -D dfs.block.size=33554432
### Land the output in your user's home directory
/user/harshal-yb
### Use the time command to report the job's duration
time

///
[harshal-yb@ip-10-0-3-7 ~]$ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -Dmapreduce.job.maps=4 -Ddfs.block.size=33554432 10240000 /user/harshal-yb/teragen
17/10/10 17:23:56 INFO client.RMProxy: Connecting to ResourceManager at ip-10-0-3-7.ec2.internal/10.0.3.7:8032
17/10/10 17:23:57 INFO terasort.TeraSort: Generating 10240000 using 4
17/10/10 17:23:57 INFO mapreduce.JobSubmitter: number of splits:4
17/10/10 17:23:57 INFO Configuration.deprecation: dfs.block.size is deprecated. Instead, use dfs.blocksize
17/10/10 17:23:57 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507651443691_0001
17/10/10 17:23:58 INFO impl.YarnClientImpl: Submitted application application_1507651443691_0001
17/10/10 17:23:58 INFO mapreduce.Job: The url to track the job: http://ip-10-0-3-7.ec2.internal:8088/proxy/application_1507651443691_0001/
17/10/10 17:23:58 INFO mapreduce.Job: Running job: job_1507651443691_0001
17/10/10 17:24:05 INFO mapreduce.Job: Job job_1507651443691_0001 running in uber mode : false
17/10/10 17:24:05 INFO mapreduce.Job:  map 0% reduce 0%
17/10/10 17:24:15 INFO mapreduce.Job:  map 25% reduce 0%
17/10/10 17:24:20 INFO mapreduce.Job:  map 61% reduce 0%
17/10/10 17:24:21 INFO mapreduce.Job:  map 81% reduce 0%
17/10/10 17:24:22 INFO mapreduce.Job:  map 100% reduce 0%
17/10/10 17:24:22 INFO mapreduce.Job: Job job_1507651443691_0001 completed successfully
17/10/10 17:24:22 INFO mapreduce.Job: Counters: 31
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=492952
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=337
		HDFS: Number of bytes written=1024000000
		HDFS: Number of read operations=16
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=8
	Job Counters 
		Launched map tasks=4
		Other local map tasks=4
		Total time spent by all maps in occupied slots (ms)=52310
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=52310
		Total vcore-seconds taken by all map tasks=52310
		Total megabyte-seconds taken by all map tasks=53565440
	Map-Reduce Framework
		Map input records=10240000
		Map output records=10240000
		Input split bytes=337
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=603
		CPU time spent (ms)=31780
		Physical memory (bytes) snapshot=1470214144
		Virtual memory (bytes) snapshot=6262333440
		Total committed heap usage (bytes)=1724907520
	org.apache.hadoop.examples.terasort.TeraGen$Counters
		CHECKSUM=21987640830259181
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=1024000000

real	0m28.504s
user	0m6.048s
sys	0m0.325s
[harshal-yb@ip-10-0-3-7 ~]$ 
///
# Run the terasort command on this file

### Use the time command to report the job's duration
time
### Land the result under your user's home directory
/user/harshal-yb/terasort/

///
[harshal-yb@ip-10-0-3-7 ~]$ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /user/harshal-yb/teragen/ /user/harshal-yb/terasort/
17/10/10 17:31:44 INFO terasort.TeraSort: starting
17/10/10 17:31:45 INFO input.FileInputFormat: Total input paths to process : 4
Spent 156ms computing base-splits.
Spent 3ms computing TeraScheduler splits.
Computing input splits took 159ms
Sampling 10 splits of 32
Making 8 from 100000 sampled records
Computing parititions took 809ms
Spent 972ms computing partitions.
17/10/10 17:31:46 INFO client.RMProxy: Connecting to ResourceManager at ip-10-0-3-7.ec2.internal/10.0.3.7:8032
17/10/10 17:31:46 INFO mapreduce.JobSubmitter: number of splits:32
17/10/10 17:31:47 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507651443691_0002
17/10/10 17:31:47 INFO impl.YarnClientImpl: Submitted application application_1507651443691_0002
17/10/10 17:31:47 INFO mapreduce.Job: The url to track the job: http://ip-10-0-3-7.ec2.internal:8088/proxy/application_1507651443691_0002/
17/10/10 17:31:47 INFO mapreduce.Job: Running job: job_1507651443691_0002
17/10/10 17:31:54 INFO mapreduce.Job: Job job_1507651443691_0002 running in uber mode : false
17/10/10 17:31:54 INFO mapreduce.Job:  map 0% reduce 0%
17/10/10 17:32:03 INFO mapreduce.Job:  map 6% reduce 0%
17/10/10 17:32:05 INFO mapreduce.Job:  map 9% reduce 0%
17/10/10 17:32:06 INFO mapreduce.Job:  map 22% reduce 0%
17/10/10 17:32:07 INFO mapreduce.Job:  map 31% reduce 0%
17/10/10 17:32:08 INFO mapreduce.Job:  map 38% reduce 0%
17/10/10 17:32:11 INFO mapreduce.Job:  map 44% reduce 0%
17/10/10 17:32:14 INFO mapreduce.Job:  map 47% reduce 0%
17/10/10 17:32:15 INFO mapreduce.Job:  map 53% reduce 0%
17/10/10 17:32:16 INFO mapreduce.Job:  map 59% reduce 0%
17/10/10 17:32:17 INFO mapreduce.Job:  map 63% reduce 0%
17/10/10 17:32:18 INFO mapreduce.Job:  map 66% reduce 0%
17/10/10 17:32:19 INFO mapreduce.Job:  map 69% reduce 0%
17/10/10 17:32:20 INFO mapreduce.Job:  map 75% reduce 0%
17/10/10 17:32:21 INFO mapreduce.Job:  map 81% reduce 0%
17/10/10 17:32:23 INFO mapreduce.Job:  map 84% reduce 0%
17/10/10 17:32:24 INFO mapreduce.Job:  map 88% reduce 0%
17/10/10 17:32:25 INFO mapreduce.Job:  map 94% reduce 0%
17/10/10 17:32:26 INFO mapreduce.Job:  map 100% reduce 0%
17/10/10 17:32:34 INFO mapreduce.Job:  map 100% reduce 25%
17/10/10 17:32:35 INFO mapreduce.Job:  map 100% reduce 38%
17/10/10 17:32:36 INFO mapreduce.Job:  map 100% reduce 50%
17/10/10 17:32:38 INFO mapreduce.Job:  map 100% reduce 60%
17/10/10 17:32:39 INFO mapreduce.Job:  map 100% reduce 78%
17/10/10 17:32:41 INFO mapreduce.Job:  map 100% reduce 96%
17/10/10 17:32:42 INFO mapreduce.Job:  map 100% reduce 100%
17/10/10 17:32:43 INFO mapreduce.Job: Job job_1507651443691_0002 completed successfully
17/10/10 17:32:43 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=453643104
		FILE: Number of bytes written=906626773
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=1024004416
		HDFS: Number of bytes written=1024000000
		HDFS: Number of read operations=120
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=16
	Job Counters 
		Launched map tasks=32
		Launched reduce tasks=8
		Data-local map tasks=31
		Rack-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=294630
		Total time spent by all reduces in occupied slots (ms)=104340
		Total time spent by all map tasks (ms)=294630
		Total time spent by all reduce tasks (ms)=104340
		Total vcore-seconds taken by all map tasks=294630
		Total vcore-seconds taken by all reduce tasks=104340
		Total megabyte-seconds taken by all map tasks=301701120
		Total megabyte-seconds taken by all reduce tasks=106844160
	Map-Reduce Framework
		Map input records=10240000
		Map output records=10240000
		Map output bytes=1044480000
		Map output materialized bytes=447995095
		Input split bytes=4416
		Combine input records=0
		Combine output records=0
		Reduce input groups=10240000
		Reduce shuffle bytes=447995095
		Reduce input records=10240000
		Reduce output records=10240000
		Spilled Records=20480000
		Shuffled Maps =256
		Failed Shuffles=0
		Merged Map outputs=256
		GC time elapsed (ms)=4473
		CPU time spent (ms)=174330
		Physical memory (bytes) snapshot=18040352768
		Virtual memory (bytes) snapshot=62860345344
		Total committed heap usage (bytes)=21269839872
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=1024000000
	File Output Format Counters 
		Bytes Written=1024000000
17/10/10 17:32:43 INFO terasort.TeraSort: done

real	1m0.217s
user	0m7.763s
sys	0m0.327s
[harshal-yb@ip-10-0-3-7 ~]$ 
///

