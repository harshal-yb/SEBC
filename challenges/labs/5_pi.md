## Hadoop pi program as user beltran

```
[root@ip-10-0-1-78 yum.repos.d]# su - beltran
[beltran@ip-10-0-1-78 ~]$ kinit
Password for beltran@HARSHAL.TX: 
[beltran@ip-10-0-1-78 ~]$ hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-0.20-mapreduce/hadoop-examples.jar pi 50 100
Number of Maps  = 50
Samples per Map = 100
Wrote input for Map #0
Wrote input for Map #1
Wrote input for Map #2
Wrote input for Map #3
Wrote input for Map #4
Wrote input for Map #5
Wrote input for Map #6
Wrote input for Map #7
Wrote input for Map #8
Wrote input for Map #9
Wrote input for Map #10
Wrote input for Map #11
Wrote input for Map #12
Wrote input for Map #13
Wrote input for Map #14
Wrote input for Map #15
Wrote input for Map #16
Wrote input for Map #17
Wrote input for Map #18
Wrote input for Map #19
Wrote input for Map #20
Wrote input for Map #21
Wrote input for Map #22
Wrote input for Map #23
Wrote input for Map #24
Wrote input for Map #25
Wrote input for Map #26
Wrote input for Map #27
Wrote input for Map #28
Wrote input for Map #29
Wrote input for Map #30
Wrote input for Map #31
Wrote input for Map #32
Wrote input for Map #33
Wrote input for Map #34
Wrote input for Map #35
Wrote input for Map #36
Wrote input for Map #37
Wrote input for Map #38
Wrote input for Map #39
Wrote input for Map #40
Wrote input for Map #41
Wrote input for Map #42
Wrote input for Map #43
Wrote input for Map #44
Wrote input for Map #45
Wrote input for Map #46
Wrote input for Map #47
Wrote input for Map #48
Wrote input for Map #49
Starting Job
17/10/13 16:23:05 INFO client.RMProxy: Connecting to ResourceManager at ip-10-0-1-78.ec2.internal/10.0.1.78:8032
17/10/13 16:23:05 INFO hdfs.DFSClient: Created token for beltran: HDFS_DELEGATION_TOKEN owner=beltran@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911785861, maxDate=1508516585861, sequenceNumber=2, masterKeyId=2 on 10.0.1.78:8020
17/10/13 16:23:05 INFO security.TokenCache: Got dt for hdfs://ip-10-0-1-78.ec2.internal:8020; Kind: HDFS_DELEGATION_TOKEN, Service: 10.0.1.78:8020, Ident: (token for beltran: HDFS_DELEGATION_TOKEN owner=beltran@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911785861, maxDate=1508516585861, sequenceNumber=2, masterKeyId=2)
17/10/13 16:23:06 INFO input.FileInputFormat: Total input paths to process : 50
17/10/13 16:23:06 INFO mapreduce.JobSubmitter: number of splits:50
17/10/13 16:23:06 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1507911520359_0002
17/10/13 16:23:06 INFO mapreduce.JobSubmitter: Kind: HDFS_DELEGATION_TOKEN, Service: 10.0.1.78:8020, Ident: (token for beltran: HDFS_DELEGATION_TOKEN owner=beltran@HARSHAL.TX, renewer=yarn, realUser=, issueDate=1507911785861, maxDate=1508516585861, sequenceNumber=2, masterKeyId=2)
17/10/13 16:23:06 INFO impl.YarnClientImpl: Submitted application application_1507911520359_0002
17/10/13 16:23:06 INFO mapreduce.Job: The url to track the job: http://ip-10-0-1-78.ec2.internal:8088/proxy/application_1507911520359_0002/
17/10/13 16:23:06 INFO mapreduce.Job: Running job: job_1507911520359_0002
17/10/13 16:23:27 INFO mapreduce.Job: Job job_1507911520359_0002 running in uber mode : false
17/10/13 16:23:27 INFO mapreduce.Job:  map 0% reduce 0%
17/10/13 16:23:40 INFO mapreduce.Job:  map 2% reduce 0%
17/10/13 16:23:41 INFO mapreduce.Job:  map 4% reduce 0%
17/10/13 16:23:42 INFO mapreduce.Job:  map 6% reduce 0%
17/10/13 16:23:43 INFO mapreduce.Job:  map 8% reduce 0%
17/10/13 16:23:44 INFO mapreduce.Job:  map 10% reduce 0%
17/10/13 16:23:46 INFO mapreduce.Job:  map 12% reduce 0%
17/10/13 16:23:48 INFO mapreduce.Job:  map 14% reduce 0%
17/10/13 16:23:50 INFO mapreduce.Job:  map 16% reduce 0%
17/10/13 16:23:53 INFO mapreduce.Job:  map 22% reduce 0%
17/10/13 16:23:54 INFO mapreduce.Job:  map 24% reduce 0%
17/10/13 16:23:58 INFO mapreduce.Job:  map 28% reduce 0%
17/10/13 16:24:03 INFO mapreduce.Job:  map 34% reduce 0%
17/10/13 16:24:04 INFO mapreduce.Job:  map 36% reduce 0%
17/10/13 16:24:08 INFO mapreduce.Job:  map 38% reduce 0%
17/10/13 16:24:09 INFO mapreduce.Job:  map 40% reduce 0%
17/10/13 16:24:14 INFO mapreduce.Job:  map 46% reduce 0%
17/10/13 16:24:15 INFO mapreduce.Job:  map 48% reduce 0%
17/10/13 16:24:18 INFO mapreduce.Job:  map 50% reduce 0%
17/10/13 16:24:20 INFO mapreduce.Job:  map 52% reduce 0%
17/10/13 16:24:22 INFO mapreduce.Job:  map 54% reduce 0%
17/10/13 16:24:23 INFO mapreduce.Job:  map 56% reduce 0%
17/10/13 16:24:26 INFO mapreduce.Job:  map 60% reduce 0%
17/10/13 16:24:28 INFO mapreduce.Job:  map 62% reduce 0%
17/10/13 16:24:30 INFO mapreduce.Job:  map 64% reduce 0%
17/10/13 16:24:31 INFO mapreduce.Job:  map 68% reduce 0%
17/10/13 16:24:32 INFO mapreduce.Job:  map 70% reduce 0%
17/10/13 16:24:34 INFO mapreduce.Job:  map 72% reduce 0%
17/10/13 16:24:36 INFO mapreduce.Job:  map 74% reduce 0%
17/10/13 16:24:37 INFO mapreduce.Job:  map 76% reduce 0%
17/10/13 16:24:41 INFO mapreduce.Job:  map 78% reduce 0%
17/10/13 16:24:43 INFO mapreduce.Job:  map 80% reduce 0%
17/10/13 16:24:47 INFO mapreduce.Job:  map 82% reduce 0%
17/10/13 16:24:48 INFO mapreduce.Job:  map 84% reduce 0%
17/10/13 16:24:52 INFO mapreduce.Job:  map 86% reduce 0%
17/10/13 16:24:54 INFO mapreduce.Job:  map 88% reduce 0%
17/10/13 16:24:57 INFO mapreduce.Job:  map 92% reduce 0%
17/10/13 16:24:58 INFO mapreduce.Job:  map 94% reduce 0%
17/10/13 16:25:01 INFO mapreduce.Job:  map 96% reduce 0%
17/10/13 16:25:02 INFO mapreduce.Job:  map 98% reduce 32%
17/10/13 16:25:05 INFO mapreduce.Job:  map 98% reduce 33%
17/10/13 16:25:07 INFO mapreduce.Job:  map 100% reduce 33%
17/10/13 16:25:09 INFO mapreduce.Job:  map 100% reduce 100%
17/10/13 16:25:09 INFO mapreduce.Job: Job job_1507911520359_0002 completed successfully
17/10/13 16:25:09 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=267
		FILE: Number of bytes written=6303002
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=14190
		HDFS: Number of bytes written=215
		HDFS: Number of read operations=203
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=3
	Job Counters 
		Launched map tasks=50
		Launched reduce tasks=1
		Data-local map tasks=50
		Total time spent by all maps in occupied slots (ms)=215669
		Total time spent by all reduces in occupied slots (ms)=16110
		Total time spent by all map tasks (ms)=215669
		Total time spent by all reduce tasks (ms)=16110
		Total vcore-seconds taken by all map tasks=215669
		Total vcore-seconds taken by all reduce tasks=16110
		Total megabyte-seconds taken by all map tasks=220845056
		Total megabyte-seconds taken by all reduce tasks=16496640
	Map-Reduce Framework
		Map input records=50
		Map output records=100
		Map output bytes=900
		Map output materialized bytes=1700
		Input split bytes=8290
		Combine input records=0
		Combine output records=0
		Reduce input groups=2
		Reduce shuffle bytes=1700
		Reduce input records=100
		Reduce output records=0
		Spilled Records=200
		Shuffled Maps =50
		Failed Shuffles=0
		Merged Map outputs=50
		GC time elapsed (ms)=1518
		CPU time spent (ms)=29030
		Physical memory (bytes) snapshot=23011897344
		Virtual memory (bytes) snapshot=80069083136
		Total committed heap usage (bytes)=26031423488
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=5900
	File Output Format Counters 
		Bytes Written=97
Job Finished in 123.625 seconds
Estimated value of Pi is 3.14160000000000000000
[beltran@ip-10-0-1-78 ~]$
```
