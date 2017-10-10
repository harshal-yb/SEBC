# Cluster Nodes
IP				Function
10.0.3.7		Cloudera Manager
10.0.3.37		Datanode
10.0.3.90		Datanode
10.0.3.95		Datanode
10.0.3.235		Datanode


# Setup SSH Keys
<code>
[root@ip-10-0-3-7 ~]# ssh-keygen 
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
79:ae:5c:04:fb:77:0a:5a:03:bf:28:d4:a9:31:a2:f9 root@ip-10-0-3-7.ec2.internal
The key's randomart image is:
+--[ RSA 2048]----+
|                 |
|                 |
|        .        |
|         +       |
|       .S.o      |
|    . + oB       |
|   o o +  O . .  |
|  o   o. * = o   |
|   .E  .= . .    |
+-----------------+
</code>
Copied the root public key to all the nodes in /root/.ssh/authorized_keys file

Added the IPs of all noeds to hosts file
<code>
[root@ip-10-0-3-235 ~]# cat hosts 
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-235 ~]# 
</code>


##Check vm.swappiness on all your nodes
<code> [root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /proc/sys/vm/swappiness";done
10.0.3.7
60
10.0.3.37
60
10.0.3.90
60
10.0.3.95
60
10.0.3.235
60
[root@ip-10-0-3-7 ~]# 
</code>
##Set the value to 1 if necessary
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "echo "vm.swappiness = 1" >> /etc/sysctl.conf; sysctl vm.swappiness=1";done
10.0.3.7
vm.swappiness = 1
10.0.3.37
vm.swappiness = 1
10.0.3.90
vm.swappiness = 1
10.0.3.95
vm.swappiness = 1
10.0.3.235
vm.swappiness = 1
[root@ip-10-0-3-7 ~]# 
[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /proc/sys/vm/swappiness";done
10.0.3.7
1
10.0.3.37
1
10.0.3.90
1
10.0.3.95
1
10.0.3.235
1
[root@ip-10-0-3-7 ~]# 


</code>
##Show the mount attributes of your volume(s)
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "mount";done
10.0.3.7
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,rootcontext="system_u:object_r:tmpfs_t:s0")
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)

10.0.3.37
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,rootcontext="system_u:object_r:tmpfs_t:s0")
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)

10.0.3.90
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,rootcontext="system_u:object_r:tmpfs_t:s0")
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)

10.0.3.95
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,rootcontext="system_u:object_r:tmpfs_t:s0")
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)

10.0.3.235
/dev/xvda1 on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw,rootcontext="system_u:object_r:tmpfs_t:s0")
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
[root@ip-10-0-3-7 ~]# 
</code>
#If you have ext-based volumes, list the reserve space setting
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "tune2fs -l /dev/xvda1 | grep \"Reserved block count\"";done
10.0.3.7
Reserved block count:     131046
10.0.3.37
Reserved block count:     131046
10.0.3.90
Reserved block count:     131046
10.0.3.95
Reserved block count:     131046
10.0.3.235
Reserved block count:     131046
[root@ip-10-0-3-7 ~]# 

</code>
##Disable transparent hugepage support
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "cat /sys/kernel/mm/transparent_hugepage/enabled";done
10.0.3.7
[always] madvise never
10.0.3.37
[always] madvise never
10.0.3.90
[always] madvise never
10.0.3.95
[always] madvise never
10.0.3.235
[always] madvise never
[root@ip-10-0-3-7 ~]# </code>
##List your network interface configuration
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "ifconfig eth0";done
10.0.3.7
eth0      Link encap:Ethernet  HWaddr 0E:27:99:F8:56:A0  
          inet addr:10.0.3.7  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::c27:99ff:fef8:56a0/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:6248 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5726 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:693702 (677.4 KiB)  TX bytes:873927 (853.4 KiB)
          Interrupt:144 

10.0.3.37
eth0      Link encap:Ethernet  HWaddr 0E:0E:77:F8:3D:C4  
          inet addr:10.0.3.37  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::c0e:77ff:fef8:3dc4/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:4500 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4165 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:545154 (532.3 KiB)  TX bytes:697742 (681.3 KiB)
          Interrupt:144 

10.0.3.90
eth0      Link encap:Ethernet  HWaddr 0E:AA:27:03:E7:6E  
          inet addr:10.0.3.90  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::caa:27ff:fe03:e76e/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:1350 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1418 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:157622 (153.9 KiB)  TX bytes:179228 (175.0 KiB)
          Interrupt:144 

10.0.3.95
eth0      Link encap:Ethernet  HWaddr 0E:A8:ED:51:F1:22  
          inet addr:10.0.3.95  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::ca8:edff:fe51:f122/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:1322 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1375 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:158468 (154.7 KiB)  TX bytes:172733 (168.6 KiB)
          Interrupt:144 

10.0.3.235
eth0      Link encap:Ethernet  HWaddr 0E:8D:0B:A9:9F:54  
          inet addr:10.0.3.235  Bcast:10.0.3.255  Mask:255.255.255.0
          inet6 addr: fe80::c8d:bff:fea9:9f54/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:2626 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2383 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:271837 (265.4 KiB)  TX bytes:353162 (344.8 KiB)
          Interrupt:144 

[root@ip-10-0-3-7 ~]# 
</code>
##Show that forward and reverse host lookups are correctly resolved
<code>
[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; nslookup $i;done | grep name
7.3.0.10.in-addr.arpa	name = ip-10-0-3-7.ec2.internal.
37.3.0.10.in-addr.arpa	name = ip-10-0-3-37.ec2.internal.
90.3.0.10.in-addr.arpa	name = ip-10-0-3-90.ec2.internal.
95.3.0.10.in-addr.arpa	name = ip-10-0-3-95.ec2.internal.
235.3.0.10.in-addr.arpa	name = ip-10-0-3-235.ec2.internal.
[root@ip-10-0-3-7 ~]# 

[root@ip-10-0-3-7 ~]# cat host_fqdn
ip-10-0-3-7.ec2.internal
ip-10-0-3-37.ec2.internal
ip-10-0-3-90.ec2.internal
ip-10-0-3-95.ec2.internal
ip-10-0-3-235.ec2.internal

[root@ip-10-0-3-7 ~]# for i in `cat host_fqdn`; do echo $i; nslookup $i;done 
ip-10-0-3-7.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-3-7.ec2.internal
Address: 10.0.3.7

ip-10-0-3-37.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-3-37.ec2.internal
Address: 10.0.3.37

ip-10-0-3-90.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-3-90.ec2.internal
Address: 10.0.3.90

ip-10-0-3-95.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-3-95.ec2.internal
Address: 10.0.3.95

ip-10-0-3-235.ec2.internal
Server:		10.0.0.2
Address:	10.0.0.2#53

Non-authoritative answer:
Name:	ip-10-0-3-235.ec2.internal
Address: 10.0.3.235

[root@ip-10-0-3-7 ~]# 

</code>
##Show the nscd service is running

<code></code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "service nscd status";done
10.0.3.7
nscd: unrecognized service
10.0.3.37
nscd: unrecognized service
10.0.3.90
nscd: unrecognized service
10.0.3.95
nscd: unrecognized service
10.0.3.235
nscd: unrecognized service
[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "yum install nscd -y";done

[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "chkconfig nscd on ;service nscd start;service nscd status";done
10.0.3.7
Starting nscd: [  OK  ]
nscd (pid 25453) is running...
10.0.3.37
Starting nscd: [  OK  ]
nscd (pid 25347) is running...
10.0.3.90
Starting nscd: [  OK  ]
nscd (pid 25010) is running...
10.0.3.95
Starting nscd: [  OK  ]
nscd (pid 25015) is running...
10.0.3.235
Starting nscd: [  OK  ]
nscd (pid 25103) is running...
[root@ip-10-0-3-7 ~]# 

## Show the ntpd service is running
<code>[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "service ntpd status";done
10.0.3.7
ntpd is stopped
10.0.3.37
ntpd is stopped
10.0.3.90
ntpd is stopped
10.0.3.95
ntpd is stopped
10.0.3.235
ntpd is stopped
[root@ip-10-0-3-7 ~]# for i in `cat hosts`; do echo $i; ssh $i "chkconfig ntpd on ;service ntpd start;service ntpd status";done
10.0.3.7
Starting ntpd: [  OK  ]
ntpd (pid  25546) is running...
10.0.3.37
Starting ntpd: [  OK  ]
ntpd (pid  25428) is running...
10.0.3.90
Starting ntpd: [  OK  ]
ntpd (pid  25090) is running...
10.0.3.95
Starting ntpd: [  OK  ]
ntpd (pid  25095) is running...
10.0.3.235
Starting ntpd: [  OK  ]
ntpd (pid  25183) is running...
[root@ip-10-0-3-7 ~]#</code>		
