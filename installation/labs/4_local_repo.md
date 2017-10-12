#Local Repo
```
[root@ip-10-0-3-7 ~]# yum install httpd
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Package httpd-2.2.15-60.el6_9.5.x86_64 already installed and latest version
Nothing to do
You have mail in /var/spool/mail/root
[root@ip-10-0-3-7 ~]# service httpd start
Starting httpd:                                            [  OK  ]
[root@ip-10-0-3-7 ~]# 
```
# Download the Parcel and Manifest file
```
[root@ip-10-0-3-7 ~]# mkdir /var/www/html//cloudera-parcel
[root@ip-10-0-3-7 ~]# cd /var/www/html/cloudera-parcel/
[root@ip-10-0-3-7 cloudera-parcel]# wget https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel
--2017-10-10 01:50:41--  https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel
Resolving archive.cloudera.com... 151.101.32.167
Connecting to archive.cloudera.com|151.101.32.167|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 16027169 (15M)
Saving to: “ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel”

100%[==============================================================================================================================>] 16,027,169  71.9M/s   in 0.2s    

2017-10-10 01:50:41 (71.9 MB/s) - “ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel” saved [16027169/16027169]

[root@ip-10-0-3-7 cloudera-parcel]# ll
total 15652
-rw-r--r-- 1 root root 16027169 Oct 11  2016 ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel
[root@ip-10-0-3-7 cloudera-parcel]# wget https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel.sha1
--2017-10-10 01:50:59--  https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel.sha1
Resolving archive.cloudera.com... 151.101.32.167
Connecting to archive.cloudera.com|151.101.32.167|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 41 [application/x-sha1]
Saving to: “ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel.sha1”

100%[==============================================================================================================================>] 41          --.-K/s   in 0s      

2017-10-10 01:50:59 (10.1 MB/s) - “ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el6.parcel.sha1” saved [41/41]

[root@ip-10-0-3-7 cloudera-parcel]# wget https://archive.cloudera.com/accumulo-c5/parcels/latest/manifest.json
--2017-10-10 01:51:11--  https://archive.cloudera.com/accumulo-c5/parcels/latest/manifest.json
Resolving archive.cloudera.com... 151.101.32.167
Connecting to archive.cloudera.com|151.101.32.167|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4534 (4.4K) [application/json]
Saving to: “manifest.json”

100%[==============================================================================================================================>] 4,534       --.-K/s   in 0s      

2017-10-10 01:51:11 (68.7 MB/s) - “manifest.json” saved [4534/4534]

[root@ip-10-0-3-7 cloudera-parcel]# 
[root@ip-10-0-3-7 /]# chmod -R ugo+rX /var/www/html/cloudera-parcel/
```
# Add the local URL to Cloudera Manager's parcel configuration

http://54.159.162.169/cloudera-parcel/
