## List the cloud provider you are using
AWS
## List your instances by IP address and DNS name (don't use /etc/hosts for this)
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; nslookup $i;done 
ip-10-0-1-65.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-1-65.ec2.internal
Address: 10.0.1.65

ip-10-0-1-78.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-1-78.ec2.internal
Address: 10.0.1.78

ip-10-0-1-175.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-1-175.ec2.internal
Address: 10.0.1.175

ip-10-0-1-182.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-1-182.ec2.internal
Address: 10.0.1.182

ip-10-0-1-183.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-1-183.ec2.internal
Address: 10.0.1.183

[root@ip-10-0-1-65 ~]# 

```
## List the Linux release you are using
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /etc/redhat-release";done
ip-10-0-1-65.ec2.internal
Red Hat Enterprise Linux Server release 6.9 (Santiago)
ip-10-0-1-78.ec2.internal
Red Hat Enterprise Linux Server release 6.9 (Santiago)
ip-10-0-1-175.ec2.internal
Red Hat Enterprise Linux Server release 6.9 (Santiago)
ip-10-0-1-182.ec2.internal
Red Hat Enterprise Linux Server release 6.9 (Santiago)
ip-10-0-1-183.ec2.internal
Red Hat Enterprise Linux Server release 6.9 (Santiago)
[root@ip-10-0-1-65 ~]# 

```
## List the file system capacity for the first node
```
CPU : 4
RAM : 15 GB
Disk : 30 GB SSD
NIC : 1
[root@ip-10-0-1-65 ~]# cat /proc/cpuinfo | grep -i processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
[root@ip-10-0-1-65 ~]# free -h
             total       used       free     shared    buffers     cached
Mem:           14G       284M        14G       144K        12M        69M
-/+ buffers/cache:       202M        14G
Swap:           0B         0B         0B
[root@ip-10-0-1-65 ~]# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1       30G  2.0G   26G   8% /
tmpfs           7.3G     0  7.3G   0% /dev/shm
[root@ip-10-0-1-65 ~]# 
[root@ip-10-0-1-65 ~]# ifconfig
eth0      Link encap:Ethernet  HWaddr 12:55:71:F5:B7:D8  
          inet addr:10.0.1.65  Bcast:10.0.1.255  Mask:255.255.255.0
          inet6 addr: fe80::1055:71ff:fef5:b7d8/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:1475 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1346 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:174104 (170.0 KiB)  TX bytes:183684 (179.3 KiB)
          Interrupt:145 


```
## List the command and output for yum repolist enabled

```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "yum repolist enabled";done
ip-10-0-1-65.ec2.internal
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
repo id                            repo name                              status
rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Clie      8
rhui-REGION-rhel-server-releases   Red Hat Enterprise Linux Server 6 (RPM 19,784
rhui-REGION-rhel-server-rh-common  Red Hat Enterprise Linux Server 6 RH C    129
repolist: 19,921
ip-10-0-1-78.ec2.internal
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
repo id                            repo name                              status
rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Clie      8
rhui-REGION-rhel-server-releases   Red Hat Enterprise Linux Server 6 (RPM 19,784
rhui-REGION-rhel-server-rh-common  Red Hat Enterprise Linux Server 6 RH C    129
repolist: 19,921
ip-10-0-1-175.ec2.internal
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
repo id                            repo name                              status
rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Clie      8
rhui-REGION-rhel-server-releases   Red Hat Enterprise Linux Server 6 (RPM 19,784
rhui-REGION-rhel-server-rh-common  Red Hat Enterprise Linux Server 6 RH C    129
repolist: 19,921
ip-10-0-1-182.ec2.internal
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
repo id                            repo name                              status
rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Clie      8
rhui-REGION-rhel-server-releases   Red Hat Enterprise Linux Server 6 (RPM 19,784
rhui-REGION-rhel-server-rh-common  Red Hat Enterprise Linux Server 6 RH C    129
repolist: 19,921
ip-10-0-1-183.ec2.internal
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
repo id                            repo name                              status
rhui-REGION-client-config-server-6 Red Hat Update Infrastructure 2.0 Clie      8
rhui-REGION-rhel-server-releases   Red Hat Enterprise Linux Server 6 (RPM 19,784
rhui-REGION-rhel-server-rh-common  Red Hat Enterprise Linux Server 6 RH C    129
repolist: 19,921
[root@ip-10-0-1-65 ~]# 

```
## Add the following Linux accounts to all nodes

### User jimenez with a UID of 2800
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "useradd -u 2800 jimenez";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "id jimenez";done
ip-10-0-1-65.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2800(jimenez)
ip-10-0-1-78.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2800(jimenez)
ip-10-0-1-175.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2800(jimenez)
ip-10-0-1-182.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2800(jimenez)
ip-10-0-1-183.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2800(jimenez)
[root@ip-10-0-1-65 ~]#
```
### User beltran with a UID of 2900

```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "useradd -u 2900 beltran";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "id beltran";done
ip-10-0-1-65.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2900(beltran)
ip-10-0-1-78.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2900(beltran)
ip-10-0-1-175.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2900(beltran)
ip-10-0-1-182.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2900(beltran)
ip-10-0-1-183.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2900(beltran)
[root@ip-10-0-1-65 ~]# 
```
### Create the group astros and add beltran to it
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "groupadd astros";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "usermod -G astros beltran";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "id beltran";done
ip-10-0-1-65.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
ip-10-0-1-78.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
ip-10-0-1-175.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
ip-10-0-1-182.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
ip-10-0-1-183.ec2.internal
uid=2900(beltran) gid=2900(beltran) groups=2901(astros),2900(beltran)
[root@ip-10-0-1-65 ~]# 

```
### Create the group rangers and add jimenez to it
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "groupadd rangers";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "usermod -G rangers jimenez";done
ip-10-0-1-65.ec2.internal
ip-10-0-1-78.ec2.internal
ip-10-0-1-175.ec2.internal
ip-10-0-1-182.ec2.internal
ip-10-0-1-183.ec2.internal
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "id jimenez";done
ip-10-0-1-65.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
ip-10-0-1-78.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
ip-10-0-1-175.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
ip-10-0-1-182.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
ip-10-0-1-183.ec2.internal
uid=2800(jimenez) gid=2800(jimenez) groups=2902(rangers),2800(jimenez)
[root@ip-10-0-1-65 ~]# 

```

## List the /etc/passwd entries for jimenez and beltran
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /etc/passwd | egrep \"jimenez|beltran\"";done
ip-10-0-1-65.ec2.internal
jimenez:x:2800:2800::/home/jimenez:/bin/bash
beltran:x:2900:2900::/home/beltran:/bin/bash
ip-10-0-1-78.ec2.internal
jimenez:x:2800:2800::/home/jimenez:/bin/bash
beltran:x:2900:2900::/home/beltran:/bin/bash
ip-10-0-1-175.ec2.internal
jimenez:x:2800:2800::/home/jimenez:/bin/bash
beltran:x:2900:2900::/home/beltran:/bin/bash
ip-10-0-1-182.ec2.internal
jimenez:x:2800:2800::/home/jimenez:/bin/bash
beltran:x:2900:2900::/home/beltran:/bin/bash
ip-10-0-1-183.ec2.internal
jimenez:x:2800:2800::/home/jimenez:/bin/bash
beltran:x:2900:2900::/home/beltran:/bin/bash
[root@ip-10-0-1-65 ~]# 

```

## List the /etc/group entries for astros and rangers
```
[root@ip-10-0-1-65 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /etc/group | egrep \"astros|rangers\"";done
ip-10-0-1-65.ec2.internal
astros:x:2901:beltran
rangers:x:2902:jimenez
ip-10-0-1-78.ec2.internal
astros:x:2901:beltran
rangers:x:2902:jimenez
ip-10-0-1-175.ec2.internal
astros:x:2901:beltran
rangers:x:2902:jimenez
ip-10-0-1-182.ec2.internal
astros:x:2901:beltran
rangers:x:2902:jimenez
ip-10-0-1-183.ec2.internal
astros:x:2901:beltran
rangers:x:2902:jimenez
[root@ip-10-0-1-65 ~]# 

```


