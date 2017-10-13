## Teragen Command
```
[jimenez@ip-10-0-1-78 ~]$ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen -Dmapreduce.job.maps=8 -Ddfs.blocksize=67108864 -Dmapreduce.map.memory.mb=512 65536000  /user/jimenez/tgen
17/10/13 15:49:44 INFO client.RMProxy: Connecting to ResourceManager at ip-10-0-1-78.ec2.internal/10.0.1.78:8032
17/10/13 15:49:44 INFO terasort.TeraSort: Generating 65536000 using 8
17/10/13 15:49:44 INFO mapreduce.JobSubmitter: number of splits:8
17/10/13 15:49:45 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507908239280_0001
17/10/13 15:49:45 INFO impl.YarnClientImpl: Submitted application application_1507908239280_0001
17/10/13 15:49:45 INFO mapreduce.Job: The url to track the job: http://ip-10-0-1-78.ec2.internal:8088/proxy/application_1507908239280_0001/
17/10/13 15:49:45 INFO mapreduce.Job: Running job: job_1507908239280_0001
17/10/13 15:49:52 INFO mapreduce.Job: Job job_1507908239280_0001 running in uber mode : false
17/10/13 15:49:52 INFO mapreduce.Job:  map 0% reduce 0%
17/10/13 15:50:04 INFO mapreduce.Job:  map 10% reduce 0%
17/10/13 15:50:05 INFO mapreduce.Job:  map 16% reduce 0%
17/10/13 15:50:07 INFO mapreduce.Job:  map 19% reduce 0%
17/10/13 15:50:08 INFO mapreduce.Job:  map 25% reduce 0%
17/10/13 15:50:10 INFO mapreduce.Job:  map 28% reduce 0%
17/10/13 15:50:11 INFO mapreduce.Job:  map 32% reduce 0%
17/10/13 15:50:13 INFO mapreduce.Job:  map 33% reduce 0%
17/10/13 15:50:14 INFO mapreduce.Job:  map 35% reduce 0%
17/10/13 15:50:16 INFO mapreduce.Job:  map 38% reduce 0%
17/10/13 15:50:17 INFO mapreduce.Job:  map 39% reduce 0%
17/10/13 15:50:18 INFO mapreduce.Job:  map 40% reduce 0%
17/10/13 15:50:19 INFO mapreduce.Job:  map 41% reduce 0%
17/10/13 15:50:20 INFO mapreduce.Job:  map 43% reduce 0%
17/10/13 15:50:22 INFO mapreduce.Job:  map 46% reduce 0%
17/10/13 15:50:24 INFO mapreduce.Job:  map 47% reduce 0%
17/10/13 15:50:25 INFO mapreduce.Job:  map 48% reduce 0%
17/10/13 15:50:26 INFO mapreduce.Job:  map 50% reduce 0%
17/10/13 15:50:27 INFO mapreduce.Job:  map 52% reduce 0%
17/10/13 15:50:29 INFO mapreduce.Job:  map 54% reduce 0%
17/10/13 15:50:30 INFO mapreduce.Job:  map 56% reduce 0%
17/10/13 15:50:31 INFO mapreduce.Job:  map 57% reduce 0%
17/10/13 15:50:32 INFO mapreduce.Job:  map 59% reduce 0%
17/10/13 15:50:33 INFO mapreduce.Job:  map 62% reduce 0%
17/10/13 15:50:35 INFO mapreduce.Job:  map 63% reduce 0%
17/10/13 15:50:36 INFO mapreduce.Job:  map 66% reduce 0%
17/10/13 15:50:38 INFO mapreduce.Job:  map 67% reduce 0%
17/10/13 15:50:39 INFO mapreduce.Job:  map 69% reduce 0%
17/10/13 15:50:41 INFO mapreduce.Job:  map 71% reduce 0%
17/10/13 15:50:42 INFO mapreduce.Job:  map 73% reduce 0%
17/10/13 15:50:44 INFO mapreduce.Job:  map 75% reduce 0%
17/10/13 15:50:45 INFO mapreduce.Job:  map 77% reduce 0%
17/10/13 15:50:46 INFO mapreduce.Job:  map 78% reduce 0%
17/10/13 15:50:47 INFO mapreduce.Job:  map 80% reduce 0%
17/10/13 15:50:48 INFO mapreduce.Job:  map 82% reduce 0%
17/10/13 15:50:49 INFO mapreduce.Job:  map 83% reduce 0%
17/10/13 15:50:50 INFO mapreduce.Job:  map 84% reduce 0%
17/10/13 15:50:51 INFO mapreduce.Job:  map 85% reduce 0%
17/10/13 15:50:52 INFO mapreduce.Job:  map 86% reduce 0%
17/10/13 15:50:53 INFO mapreduce.Job:  map 87% reduce 0%
17/10/13 15:50:54 INFO mapreduce.Job:  map 90% reduce 0%
17/10/13 15:50:57 INFO mapreduce.Job:  map 93% reduce 0%
17/10/13 15:51:00 INFO mapreduce.Job:  map 96% reduce 0%
17/10/13 15:51:03 INFO mapreduce.Job:  map 98% reduce 0%
17/10/13 15:51:05 INFO mapreduce.Job:  map 100% reduce 0%
17/10/13 15:51:05 INFO mapreduce.Job: Job job_1507908239280_0001 completed successfully
17/10/13 15:51:05 INFO mapreduce.Job: Counters: 31
	File System Counters
		FILE: Number of bytes read=0
		FILE: Number of bytes written=977040
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=682
		HDFS: Number of bytes written=6553600000
		HDFS: Number of read operations=32
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=16
	Job Counters 
		Launched map tasks=8
		Other local map tasks=8
		Total time spent by all maps in occupied slots (ms)=491196
		Total time spent by all reduces in occupied slots (ms)=0
		Total time spent by all map tasks (ms)=491196
		Total vcore-seconds taken by all map tasks=491196
		Total megabyte-seconds taken by all map tasks=502984704
	Map-Reduce Framework
		Map input records=65536000
		Map output records=65536000
		Input split bytes=682
		Spilled Records=0
		Failed Shuffles=0
		Merged Map outputs=0
		GC time elapsed (ms)=1735
		CPU time spent (ms)=130640
		Physical memory (bytes) snapshot=1359978496
		Virtual memory (bytes) snapshot=8929333248
		Total committed heap usage (bytes)=1798307840
	org.apache.hadoop.examples.terasort.TeraGen$Counters
		CHECKSUM=140750829423462787
	File Input Format Counters 
		Bytes Read=0
	File Output Format Counters 
		Bytes Written=6553600000

real	1m24.363s
user	0m6.050s
sys	0m0.339s
[jimenez@ip-10-0-1-78 ~]$ 
```
## The result of the time command
```
real	1m24.363s
user	0m6.050s
sys	0m0.339s
```
## The command and output of hdfs dfs -ls /user/jimenez/tgen
```
[jimenez@ip-10-0-1-78 ~]$ hdfs dfs -ls /user/jimenez/tgen
Found 9 items
-rw-r--r--   3 jimenez rangers          0 2017-10-13 15:51 /user/jimenez/tgen/_SUCCESS
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:50 /user/jimenez/tgen/part-m-00000
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:50 /user/jimenez/tgen/part-m-00001
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:51 /user/jimenez/tgen/part-m-00002
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:51 /user/jimenez/tgen/part-m-00003
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:50 /user/jimenez/tgen/part-m-00004
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:50 /user/jimenez/tgen/part-m-00005
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:50 /user/jimenez/tgen/part-m-00006
-rw-r--r--   3 jimenez rangers  819200000 2017-10-13 15:51 /user/jimenez/tgen/part-m-00007
[jimenez@ip-10-0-1-78 ~]$ 

```
## The command and output of hadoop fsck -blocks /user/jimenez
```
[root@ip-10-0-1-78 yum.repos.d]# sudo -u hdfs hadoop fsck -blocks /user/jimenez
DEPRECATED: Use of this script to execute hdfs command is deprecated.
Instead use the hdfs command for it.

Connecting to namenode via http://ip-10-0-1-78.ec2.internal:50070
FSCK started by hdfs (auth:SIMPLE) from /10.0.1.78 for path /user/jimenez at Fri Oct 13 15:52:43 UTC 2017
.........Status: HEALTHY
 Total size:	6553600000 B
 Total dirs:	3
 Total files:	9
 Total symlinks:		0
 Total blocks (validated):	104 (avg. block size 63015384 B)
 Minimally replicated blocks:	104 (100.0 %)
 Over-replicated blocks:	0 (0.0 %)
 Under-replicated blocks:	0 (0.0 %)
 Mis-replicated blocks:		0 (0.0 %)
 Default replication factor:	3
 Average block replication:	3.0
 Corrupt blocks:		0
 Missing replicas:		0 (0.0 %)
 Number of data-nodes:		4
 Number of racks:		1
FSCK ended at Fri Oct 13 15:52:43 UTC 2017 in 6 milliseconds


The filesystem under path '/user/jimenez' is HEALTHY
[root@ip-10-0-1-78 yum.repos.d]# 

```
