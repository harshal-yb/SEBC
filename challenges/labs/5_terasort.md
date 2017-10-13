## Terasort output for jimenez

```
[jimenez@ip-10-0-1-65 ~]$ kinit
Password for jimenez@HARSHAL.TX: 
[jimenez@ip-10-0-1-65 ~]$ klist
Ticket cache: FILE:/tmp/krb5cc_2800
Default principal: jimenez@HARSHAL.TX

Valid starting     Expires            Service principal
10/13/17 16:12:28  10/14/17 16:12:28  krbtgt/HARSHAL.TX@HARSHAL.TX
	renew until 10/20/17 16:12:28
[jimenez@ip-10-0-1-65 ~]$ logout
[root@ip-10-0-1-65 ~]# hostname
ip-10-0-1-65.ec2.internal
[root@ip-10-0-1-65 ~]# su - jimenez
[jimenez@ip-10-0-1-65 ~]$ klist
Ticket cache: FILE:/tmp/krb5cc_2800
Default principal: jimenez@HARSHAL.TX

Valid starting     Expires            Service principal
10/13/17 16:12:28  10/14/17 16:12:28  krbtgt/HARSHAL.TX@HARSHAL.TX
	renew until 10/20/17 16:12:28
[jimenez@ip-10-0-1-65 ~]$ /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /user/jimenez/tgen/ /user/jimenez/tsort/
17/10/13 16:21:13 INFO terasort.TeraSort: starting
17/10/13 16:21:15 INFO hdfs.DFSClient: Created token for jimenez: HDFS_DELEGATION_TOKEN owner=jimenez@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911675190, maxDate=1508516475190, sequenceNumber=1, masterKeyId=2 on 10.0.1.78:8020
17/10/13 16:21:15 INFO security.TokenCache: Got dt for hdfs://ip-10-0-1-78.ec2.internal:8020; Kind: HDFS_DELEGATION_TOKEN, Service: 10.0.1.78:8020, Ident: (token for jimenez: HDFS_DELEGATION_TOKEN owner=jimenez@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911675190, maxDate=1508516475190, sequenceNumber=1, masterKeyId=2)
17/10/13 16:21:15 INFO input.FileInputFormat: Total input paths to process : 8
Spent 356ms computing base-splits.
Spent 4ms computing TeraScheduler splits.
Computing input splits took 361ms
Sampling 10 splits of 104
Making 8 from 100000 sampled records
Computing parititions took 906ms
Spent 1269ms computing partitions.
17/10/13 16:21:16 INFO client.RMProxy: Connecting to ResourceManager at ip-10-0-1-78.ec2.internal/10.0.1.78:8032
17/10/13 16:21:16 INFO mapreduce.JobSubmitter: number of splits:104
17/10/13 16:21:16 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507911520359_0001
17/10/13 16:21:16 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: 10.0.1.78:8020, Ident: (token for jimenez: HDFS_DELEGATION_TOKEN owner=jimenez@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911675190, maxDate=1508516475190, sequenceNumber=1, masterKeyId=2)
17/10/13 16:21:18 INFO impl.YarnClientImpl: Submitted application application_1507911520359_0001
17/10/13 16:21:18 INFO mapreduce.Job: The url to track the job: http://ip-10-0-1-78.ec2.internal:8088/proxy/application_1507911520359_0001/
17/10/13 16:21:18 INFO mapreduce.Job: Running job: job_1507911520359_0001
17/10/13 16:21:28 INFO mapreduce.Job: Job job_1507911520359_0001 running in uber mode : false
17/10/13 16:21:28 INFO mapreduce.Job:  map 0% reduce 0%
17/10/13 16:21:36 INFO mapreduce.Job:  map 1% reduce 0%
17/10/13 16:21:40 INFO mapreduce.Job:  map 2% reduce 0%
17/10/13 16:21:43 INFO mapreduce.Job:  map 3% reduce 0%
17/10/13 16:21:45 INFO mapreduce.Job:  map 4% reduce 0%
17/10/13 16:21:46 INFO mapreduce.Job:  map 9% reduce 0%
17/10/13 16:21:47 INFO mapreduce.Job:  map 10% reduce 0%
17/10/13 16:21:49 INFO mapreduce.Job:  map 11% reduce 0%
17/10/13 16:21:54 INFO mapreduce.Job:  map 12% reduce 0%
17/10/13 16:21:55 INFO mapreduce.Job:  map 13% reduce 0%
17/10/13 16:21:57 INFO mapreduce.Job:  map 17% reduce 0%
17/10/13 16:21:58 INFO mapreduce.Job:  map 18% reduce 0%
17/10/13 16:22:01 INFO mapreduce.Job:  map 19% reduce 0%
17/10/13 16:22:04 INFO mapreduce.Job:  map 20% reduce 0%
17/10/13 16:22:05 INFO mapreduce.Job:  map 21% reduce 0%
17/10/13 16:22:06 INFO mapreduce.Job:  map 22% reduce 0%
17/10/13 16:22:08 INFO mapreduce.Job:  map 27% reduce 0%
17/10/13 16:22:11 INFO mapreduce.Job:  map 28% reduce 0%
17/10/13 16:22:15 INFO mapreduce.Job:  map 30% reduce 0%
17/10/13 16:22:18 INFO mapreduce.Job:  map 34% reduce 0%
17/10/13 16:22:19 INFO mapreduce.Job:  map 36% reduce 0%
17/10/13 16:22:22 INFO mapreduce.Job:  map 37% reduce 0%
17/10/13 16:22:24 INFO mapreduce.Job:  map 38% reduce 0%
17/10/13 16:22:28 INFO mapreduce.Job:  map 39% reduce 0%
17/10/13 16:22:29 INFO mapreduce.Job:  map 43% reduce 0%
17/10/13 16:22:30 INFO mapreduce.Job:  map 44% reduce 0%
17/10/13 16:22:31 INFO mapreduce.Job:  map 45% reduce 0%
17/10/13 16:22:36 INFO mapreduce.Job:  map 46% reduce 0%
17/10/13 16:22:37 INFO mapreduce.Job:  map 47% reduce 0%
17/10/13 16:22:38 INFO mapreduce.Job:  map 48% reduce 0%
17/10/13 16:22:39 INFO mapreduce.Job:  map 50% reduce 0%
17/10/13 16:22:40 INFO mapreduce.Job:  map 53% reduce 0%
17/10/13 16:22:43 INFO mapreduce.Job:  map 54% reduce 0%
17/10/13 16:22:45 INFO mapreduce.Job:  map 55% reduce 0%
17/10/13 16:22:47 INFO mapreduce.Job:  map 56% reduce 0%
17/10/13 16:22:49 INFO mapreduce.Job:  map 57% reduce 0%
17/10/13 16:22:50 INFO mapreduce.Job:  map 61% reduce 0%
17/10/13 16:22:52 INFO mapreduce.Job:  map 63% reduce 0%
17/10/13 16:22:57 INFO mapreduce.Job:  map 64% reduce 0%
17/10/13 16:22:59 INFO mapreduce.Job:  map 65% reduce 0%
17/10/13 16:23:00 INFO mapreduce.Job:  map 68% reduce 0%
17/10/13 16:23:02 INFO mapreduce.Job:  map 70% reduce 0%
17/10/13 16:23:04 INFO mapreduce.Job:  map 71% reduce 0%
17/10/13 16:23:07 INFO mapreduce.Job:  map 73% reduce 0%
17/10/13 16:23:09 INFO mapreduce.Job:  map 74% reduce 0%
17/10/13 16:23:10 INFO mapreduce.Job:  map 75% reduce 0%
17/10/13 16:23:11 INFO mapreduce.Job:  map 76% reduce 0%
17/10/13 16:23:12 INFO mapreduce.Job:  map 78% reduce 0%
17/10/13 16:23:13 INFO mapreduce.Job:  map 79% reduce 0%
17/10/13 16:23:14 INFO mapreduce.Job:  map 80% reduce 0%
17/10/13 16:23:17 INFO mapreduce.Job:  map 81% reduce 0%
17/10/13 16:23:18 INFO mapreduce.Job:  map 82% reduce 0%
17/10/13 16:23:19 INFO mapreduce.Job:  map 83% reduce 0%
17/10/13 16:23:20 INFO mapreduce.Job:  map 85% reduce 0%
17/10/13 16:23:22 INFO mapreduce.Job:  map 87% reduce 0%
17/10/13 16:23:25 INFO mapreduce.Job:  map 88% reduce 0%
17/10/13 16:23:27 INFO mapreduce.Job:  map 89% reduce 0%
17/10/13 16:23:29 INFO mapreduce.Job:  map 90% reduce 0%
17/10/13 16:23:31 INFO mapreduce.Job:  map 91% reduce 0%
17/10/13 16:23:34 INFO mapreduce.Job:  map 91% reduce 6%
17/10/13 16:23:35 INFO mapreduce.Job:  map 92% reduce 10%
17/10/13 16:23:36 INFO mapreduce.Job:  map 93% reduce 10%
17/10/13 16:23:37 INFO mapreduce.Job:  map 93% reduce 12%
17/10/13 16:23:38 INFO mapreduce.Job:  map 94% reduce 12%
17/10/13 16:23:47 INFO mapreduce.Job:  map 95% reduce 12%
17/10/13 16:23:49 INFO mapreduce.Job:  map 96% reduce 12%
17/10/13 16:23:59 INFO mapreduce.Job:  map 97% reduce 12%
17/10/13 16:24:00 INFO mapreduce.Job:  map 98% reduce 12%
17/10/13 16:24:09 INFO mapreduce.Job:  map 99% reduce 12%
17/10/13 16:24:10 INFO mapreduce.Job:  map 100% reduce 12%
17/10/13 16:24:11 INFO mapreduce.Job:  map 100% reduce 14%
17/10/13 16:24:12 INFO mapreduce.Job:  map 100% reduce 18%
17/10/13 16:24:14 INFO mapreduce.Job:  map 100% reduce 25%
17/10/13 16:24:15 INFO mapreduce.Job:  map 100% reduce 26%
17/10/13 16:24:17 INFO mapreduce.Job:  map 100% reduce 28%
17/10/13 16:24:18 INFO mapreduce.Job:  map 100% reduce 30%
17/10/13 16:24:20 INFO mapreduce.Job:  map 100% reduce 31%
17/10/13 16:24:21 INFO mapreduce.Job:  map 100% reduce 33%
17/10/13 16:24:23 INFO mapreduce.Job:  map 100% reduce 34%
17/10/13 16:24:24 INFO mapreduce.Job:  map 100% reduce 35%
17/10/13 16:24:27 INFO mapreduce.Job:  map 100% reduce 36%
17/10/13 16:24:28 INFO mapreduce.Job:  map 100% reduce 40%
17/10/13 16:24:31 INFO mapreduce.Job:  map 100% reduce 42%
17/10/13 16:24:34 INFO mapreduce.Job:  map 100% reduce 46%
17/10/13 16:24:35 INFO mapreduce.Job:  map 100% reduce 50%
17/10/13 16:24:40 INFO mapreduce.Job:  map 100% reduce 51%
17/10/13 16:24:41 INFO mapreduce.Job:  map 100% reduce 55%
17/10/13 16:24:43 INFO mapreduce.Job:  map 100% reduce 56%
17/10/13 16:24:44 INFO mapreduce.Job:  map 100% reduce 64%
17/10/13 16:24:45 INFO mapreduce.Job:  map 100% reduce 66%
17/10/13 16:24:46 INFO mapreduce.Job:  map 100% reduce 67%
17/10/13 16:24:47 INFO mapreduce.Job:  map 100% reduce 74%
17/10/13 16:24:48 INFO mapreduce.Job:  map 100% reduce 75%
17/10/13 16:24:49 INFO mapreduce.Job:  map 100% reduce 76%
17/10/13 16:24:50 INFO mapreduce.Job:  map 100% reduce 80%
17/10/13 16:24:53 INFO mapreduce.Job:  map 100% reduce 85%
17/10/13 16:24:54 INFO mapreduce.Job:  map 100% reduce 89%
17/10/13 16:24:56 INFO mapreduce.Job:  map 100% reduce 92%
17/10/13 16:24:59 INFO mapreduce.Job:  map 100% reduce 93%
17/10/13 16:25:00 INFO mapreduce.Job:  map 100% reduce 94%
17/10/13 16:25:02 INFO mapreduce.Job:  map 100% reduce 95%
17/10/13 16:25:03 INFO mapreduce.Job:  map 100% reduce 96%
17/10/13 16:25:06 INFO mapreduce.Job:  map 100% reduce 98%
17/10/13 16:25:09 INFO mapreduce.Job:  map 100% reduce 99%
17/10/13 16:25:10 INFO mapreduce.Job:  map 100% reduce 100%
17/10/13 16:25:11 INFO mapreduce.Job: Job job_1507911520359_0001 completed successfully
17/10/13 16:25:11 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=2935219278
		FILE: Number of bytes written=5822368158
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=6553613832
		HDFS: Number of bytes written=6553600000
		HDFS: Number of read operations=336
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=16
	Job Counters 
		Launched map tasks=104
		Launched reduce tasks=8
		Data-local map tasks=104
		Total time spent by all maps in occupied slots (ms)=875094
		Total time spent by all reduces in occupied slots (ms)=338593
		Total time spent by all map tasks (ms)=875094
		Total time spent by all reduce tasks (ms)=338593
		Total vcore-seconds taken by all map tasks=875094
		Total vcore-seconds taken by all reduce tasks=338593
		Total megabyte-seconds taken by all map tasks=896096256
		Total megabyte-seconds taken by all reduce tasks=346719232
	Map-Reduce Framework
		Map input records=65536000
		Map output records=65536000
		Map output bytes=6684672000
		Map output materialized bytes=2873221966
		Input split bytes=13832
		Combine input records=0
		Combine output records=0
		Reduce input groups=65536000
		Reduce shuffle bytes=2873221966
		Reduce input records=65536000
		Reduce output records=65536000
		Spilled Records=131072000
		Shuffled Maps =832
		Failed Shuffles=0
		Merged Map outputs=832
		GC time elapsed (ms)=15025
		CPU time spent (ms)=695780
		Physical memory (bytes) snapshot=59153498112
		Virtual memory (bytes) snapshot=175462174720
		Total committed heap usage (bytes)=66889187328
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=6553600000
	File Output Format Counters 
		Bytes Written=6553600000
17/10/13 16:25:11 INFO terasort.TeraSort: done
[jimenez@ip-10-0-1-65 ~]$ 
```


