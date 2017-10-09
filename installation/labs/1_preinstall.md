# Cluster Nodes
IP				Function
10.0.3.7		Cloudera Manager
10.0.3.37		Datanode
10.0.3.90		Datanode
10.0.3.95		Datanode
10.0.3.235		Datanode


# Setup SSH Keys
///
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

////
Copied the root public key to all the nodes in /root/.ssh/authorized_keys file

Added the IPs of all noeds to hosts file
///
[root@ip-10-0-3-235 ~]# cat hosts 
10.0.3.7
10.0.3.37
10.0.3.90
10.0.3.95
10.0.3.235
[root@ip-10-0-3-235 ~]# 
///

