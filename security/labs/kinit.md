[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# kadmin.local 
Authenticating as principal root/admin@HARSHAL.COM with password.
kadmin.local:  addprinc harshal@HARSHAL.COM
WARNING: no policy specified for harshal@HARSHAL.COM; defaulting to no policy
Enter password for principal "harshal@HARSHAL.COM": 
Re-enter password for principal "harshal@HARSHAL.COM": 
Principal "harshal@HARSHAL.COM" created.
kadmin.local:  quit
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# su - harshal
[harshal@ip-10-0-3-7 ~]$ kinit
Password for harshal@HARSHAL.COM: 
[harshal@ip-10-0-3-7 ~]$ klist 
Ticket cache: FILE:/tmp/krb5cc_502
Default principal: harshal@HARSHAL.COM

Valid starting     Expires            Service principal
10/11/17 22:00:46  10/12/17 22:00:46  krbtgt/HARSHAL.COM@HARSHAL.COM
	renew until 10/18/17 22:00:46
[harshal@ip-10-0-3-7 ~]$ 

