## Have Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 8 Download and move to /usr/java/latest/jre/lib/security/
```
[root@ip-10-0-3-7 ~]# wget http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip?AuthParam=1507758286_8fa29483e1df974612126d651e2b060f
--2017-10-11 21:43:05--  http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip?AuthParam=1507758286_8fa29483e1df974612126d651e2b060f
Resolving download.oracle.com... 23.215.130.99, 23.215.130.114
Connecting to download.oracle.com|23.215.130.99|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 8409 (8.2K) [application/zip]
Saving to: “jce_policy-8.zip?AuthParam=1507758286_8fa29483e1df974612126d651e2b060f”

100%[==============================================================================================================================>] 8,409       --.-K/s   in 0s      

2017-10-11 21:43:05 (407 MB/s) - “jce_policy-8.zip?AuthParam=1507758286_8fa29483e1df974612126d651e2b060f” saved [8409/8409]

You have new mail in /var/spool/mail/root
[root@ip-10-0-3-7 ~]# mv jce_policy-8.zip\?AuthParam\=1507758286_8fa29483e1df974612126d651e2b060f jce_policy-8.zip
[root@ip-10-0-3-7 ~]# unzip jce_policy-8.zip 
Archive:  jce_policy-8.zip
   creating: UnlimitedJCEPolicyJDK8/
  inflating: UnlimitedJCEPolicyJDK8/local_policy.jar  
  inflating: UnlimitedJCEPolicyJDK8/README.txt  
  inflating: UnlimitedJCEPolicyJDK8/US_export_policy.jar  
[root@ip-10-0-3-7 ~]# cd UnlimitedJCEPolicyJDK8/
```
```
root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]# for i in `cat ~/hosts`; do echo $i; scp *.jar $i:/usr/java/latest/jre/lib/security/;done
10.0.3.7
local_policy.jar                                                                                                                      100% 3035     3.0KB/s   00:00    
US_export_policy.jar                                                                                                                  100% 3023     3.0KB/s   00:00    
10.0.3.37
local_policy.jar                                                                                                                      100% 3035     3.0KB/s   00:00    
US_export_policy.jar                                                                                                                  100% 3023     3.0KB/s   00:00    
10.0.3.90
local_policy.jar                                                                                                                      100% 3035     3.0KB/s   00:00    
US_export_policy.jar                                                                                                                  100% 3023     3.0KB/s   00:00    
10.0.3.95
local_policy.jar                                                                                                                      100% 3035     3.0KB/s   00:00    
US_export_policy.jar                                                                                                                  100% 3023     3.0KB/s   00:00    
10.0.3.235
local_policy.jar                                                                                                                      100% 3035     3.0KB/s   00:00    
US_export_policy.jar                                                                                                                  100% 3023     3.0KB/s   00:00    
[root@ip-10-0-3-7 UnlimitedJCEPolicyJDK8]#
```

## Install Kerberos server on One of the node which will server as KDC
```
[root@ip-10-0-3-7 ~]# yum -y install krb5-server
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package krb5-server.x86_64 0:1.10.3-65.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

========================================================================================================================================================================
 Package                            Arch                          Version                                 Repository                                               Size
========================================================================================================================================================================
Installing:
 krb5-server                        x86_64                        1.10.3-65.el6                           rhui-REGION-rhel-server-releases                        2.0 M

Transaction Summary
========================================================================================================================================================================
Install       1 Package(s)

Total download size: 2.0 M
Installed size: 2.9 M
Downloading Packages:
krb5-server-1.10.3-65.el6.x86_64.rpm                                                                                                             | 2.0 MB     00:00     
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : krb5-server-1.10.3-65.el6.x86_64                                                                                                                     1/1 
  Verifying  : krb5-server-1.10.3-65.el6.x86_64                                                                                                                     1/1 

Installed:
  krb5-server.x86_64 0:1.10.3-65.el6                                                                                                                                    

Complete!
[root@ip-10-0-3-7 ~]# 
``` 

## Install Kerberos packages on all the nodes
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; ssh $i "yum -y install krb5-workstation krb5-libs krb5-auth-dialog";done
10.0.3.7
Loaded plugins: amazon-id, rhui-lb, search-disabled-repos, security
Setting up Install Process
Package krb5-workstation-1.10.3-65.el6.x86_64 already installed and latest version
Package krb5-libs-1.10.3-65.el6.x86_64 already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package krb5-auth-dialog.x86_64 0:0.13-6.el6 will be installed
--> Processing Dependency: libgnomeui >= 2.9.1 for package: krb5-auth-dialog-0.13-6.el6.x86_64
--> Processing Dependency: GConf2 for package: krb5-auth-dialog-0.13-6.el6.x86_64
--> Processing Dependency: GConf2 for package: krb5-auth-dialog-0.13-6.el6.x86_64
--> Processing Dependency: libgconf-2.so.4()(64bit) for package: krb5-auth-dialog-0.13-6.el6.x86_64
--> Processing Dependency: libnotify.so.1()(64bit) for package: krb5-auth-dialog-0.13-6.el6.x86_64
--> Running transaction check
---> Package GConf2.x86_64 0:2.28.0-7.el6 will be installed
--> Processing Dependency: sgml-common for package: GConf2-2.28.0-7.el6.x86_64
--> Processing Dependency: libORBit-2.so.0()(64bit) for package: GConf2-2.28.0-7.el6.x86_64
---> Package libgnomeui.x86_64 0:2.24.1-4.el6 will be installed
--> Processing Dependency: libbonoboui-2.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
--> Processing Dependency: libglade-2.0.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
--> Processing Dependency: libgnome-2.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
--> Processing Dependency: libgnome-keyring.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
--> Processing Dependency: libgnomecanvas-2.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
--> Processing Dependency: libgnomevfs-2.so.0()(64bit) for package: libgnomeui-2.24.1-4.el6.x86_64
---> Package libnotify.x86_64 0:0.5.0-1.el6 will be installed
--> Processing Dependency: desktop-notification-daemon for package: libnotify-0.5.0-1.el6.x86_64
--> Running transaction check
---> Package ORBit2.x86_64 0:2.14.17-6.el6_8 will be installed
--> Processing Dependency: libIDL-2.so.0()(64bit) for package: ORBit2-2.14.17-6.el6_8.x86_64
---> Package gnome-keyring.x86_64 0:2.28.2-8.el6_3 will be installed
---> Package gnome-vfs2.x86_64 0:2.24.2-8.el6 will be installed
--> Processing Dependency: libavahi-glib.so.1()(64bit) for package: gnome-vfs2-2.24.2-8.el6.x86_64
---> Package libbonoboui.x86_64 0:2.24.2-3.el6 will be installed
--> Processing Dependency: libbonobo-2.so.0()(64bit) for package: libbonoboui-2.24.2-3.el6.x86_64
--> Processing Dependency: libbonobo-activation.so.4()(64bit) for package: libbonoboui-2.24.2-3.el6.x86_64
---> Package libglade2.x86_64 0:2.6.4-3.1.el6 will be installed
---> Package libgnome.x86_64 0:2.28.0-11.el6 will be installed
--> Processing Dependency: system-gnome-theme >= 60.0.0 for package: libgnome-2.28.0-11.el6.x86_64
---> Package libgnomecanvas.x86_64 0:2.26.0-4.el6 will be installed
---> Package notification-daemon.x86_64 0:0.5.0-1.el6 will be installed
--> Processing Dependency: libcanberra-gtk.so.0()(64bit) for package: notification-daemon-0.5.0-1.el6.x86_64
--> Processing Dependency: libcanberra.so.0()(64bit) for package: notification-daemon-0.5.0-1.el6.x86_64
--> Processing Dependency: libwnck-1.so.22()(64bit) for package: notification-daemon-0.5.0-1.el6.x86_64
---> Package sgml-common.noarch 0:0.6.3-33.el6 will be installed
--> Running transaction check
---> Package avahi-glib.x86_64 0:0.6.25-17.el6 will be installed
---> Package libIDL.x86_64 0:0.8.13-2.1.el6 will be installed
---> Package libbonobo.x86_64 0:2.24.2-5.el6 will be installed
---> Package libcanberra.x86_64 0:0.22-3.el6 will be installed
--> Processing Dependency: pulseaudio-libs >= 0.9.15 for package: libcanberra-0.22-3.el6.x86_64
--> Processing Dependency: libpulse.so.0(PULSE_0)(64bit) for package: libcanberra-0.22-3.el6.x86_64
--> Processing Dependency: sound-theme-freedesktop for package: libcanberra-0.22-3.el6.x86_64
--> Processing Dependency: libpulse.so.0()(64bit) for package: libcanberra-0.22-3.el6.x86_64
---> Package libcanberra-gtk2.x86_64 0:0.22-3.el6 will be installed
---> Package libwnck.x86_64 0:2.28.0-3.el6 will be installed
--> Processing Dependency: startup-notification >= 0.5 for package: libwnck-2.28.0-3.el6.x86_64
--> Processing Dependency: libXRes.so.1()(64bit) for package: libwnck-2.28.0-3.el6.x86_64
--> Processing Dependency: libstartup-notification-1.so.0()(64bit) for package: libwnck-2.28.0-3.el6.x86_64
---> Package system-gnome-theme.noarch 0:60.0.2-1.el6 will be installed
--> Processing Dependency: dmz-cursor-themes for package: system-gnome-theme-60.0.2-1.el6.noarch
--> Processing Dependency: system-icon-theme for package: system-gnome-theme-60.0.2-1.el6.noarch
--> Running transaction check
---> Package dmz-cursor-themes.noarch 0:0.4-4.el6 will be installed
---> Package libXres.x86_64 0:1.0.7-2.1.el6 will be installed
---> Package pulseaudio-libs.x86_64 0:0.9.21-26.el6 will be installed
--> Processing Dependency: libsndfile.so.1(libsndfile.so.1.0)(64bit) for package: pulseaudio-libs-0.9.21-26.el6.x86_64
--> Processing Dependency: libasyncns.so.0()(64bit) for package: pulseaudio-libs-0.9.21-26.el6.x86_64
--> Processing Dependency: libsndfile.so.1()(64bit) for package: pulseaudio-libs-0.9.21-26.el6.x86_64
---> Package sound-theme-freedesktop.noarch 0:0.7-3.el6 will be installed
---> Package startup-notification.x86_64 0:0.10-2.1.el6 will be installed
--> Processing Dependency: libxcb-atom.so.1()(64bit) for package: startup-notification-0.10-2.1.el6.x86_64
--> Processing Dependency: libxcb-aux.so.0()(64bit) for package: startup-notification-0.10-2.1.el6.x86_64
--> Processing Dependency: libxcb-event.so.1()(64bit) for package: startup-notification-0.10-2.1.el6.x86_64
---> Package system-icon-theme.noarch 0:6.0.0-2.el6 will be installed
--> Processing Dependency: gnome-themes for package: system-icon-theme-6.0.0-2.el6.noarch
--> Running transaction check
---> Package compat-xcb-util.x86_64 0:0.4.0-2.2.el6 will be installed
---> Package gnome-themes.noarch 0:2.28.1-7.el6 will be installed
--> Processing Dependency: gtk2-engines >= 2.15.3 for package: gnome-themes-2.28.1-7.el6.noarch
--> Processing Dependency: gnome-icon-theme for package: gnome-themes-2.28.1-7.el6.noarch
---> Package libasyncns.x86_64 0:0.8-1.1.el6 will be installed
---> Package libsndfile.x86_64 0:1.0.20-5.el6 will be installed
--> Processing Dependency: libFLAC.so.8()(64bit) for package: libsndfile-1.0.20-5.el6.x86_64
--> Running transaction check
---> Package flac.x86_64 0:1.2.1-7.el6_6 will be installed
---> Package gnome-icon-theme.noarch 0:2.28.0-8.el6 will be installed
---> Package gtk2-engines.x86_64 0:2.18.4-5.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package           Arch   Version        Repository                        Size
================================================================================
Installing:
 krb5-auth-dialog  x86_64 0.13-6.el6     rhui-REGION-rhel-server-releases 211 k
Installing for dependencies:
 GConf2            x86_64 2.28.0-7.el6   rhui-REGION-rhel-server-releases 963 k
 ORBit2            x86_64 2.14.17-6.el6_8
                                         rhui-REGION-rhel-server-releases 169 k
 avahi-glib        x86_64 0.6.25-17.el6  rhui-REGION-rhel-server-releases  21 k
 compat-xcb-util   x86_64 0.4.0-2.2.el6  rhui-REGION-rhel-server-releases  25 k
 dmz-cursor-themes noarch 0.4-4.el6      rhui-REGION-rhel-server-releases 390 k
 flac              x86_64 1.2.1-7.el6_6  rhui-REGION-rhel-server-releases 242 k
 gnome-icon-theme  noarch 2.28.0-8.el6   rhui-REGION-rhel-server-releases 4.0 M
 gnome-keyring     x86_64 2.28.2-8.el6_3 rhui-REGION-rhel-server-releases 812 k
 gnome-themes      noarch 2.28.1-7.el6   rhui-REGION-rhel-server-releases 3.4 M
 gnome-vfs2        x86_64 2.24.2-8.el6   rhui-REGION-rhel-server-releases 740 k
 gtk2-engines      x86_64 2.18.4-5.el6   rhui-REGION-rhel-server-releases 282 k
 libIDL            x86_64 0.8.13-2.1.el6 rhui-REGION-rhel-server-releases  83 k
 libXres           x86_64 1.0.7-2.1.el6  rhui-REGION-rhel-server-releases  12 k
 libasyncns        x86_64 0.8-1.1.el6    rhui-REGION-rhel-server-releases  24 k
 libbonobo         x86_64 2.24.2-5.el6   rhui-REGION-rhel-server-releases 418 k
 libbonoboui       x86_64 2.24.2-3.el6   rhui-REGION-rhel-server-releases 326 k
 libcanberra       x86_64 0.22-3.el6     rhui-REGION-rhel-server-releases  67 k
 libcanberra-gtk2  x86_64 0.22-3.el6     rhui-REGION-rhel-server-releases  26 k
 libglade2         x86_64 2.6.4-3.1.el6  rhui-REGION-rhel-server-releases  59 k
 libgnome          x86_64 2.28.0-11.el6  rhui-REGION-rhel-server-releases 502 k
 libgnomecanvas    x86_64 2.26.0-4.el6   rhui-REGION-rhel-server-releases 208 k
 libgnomeui        x86_64 2.24.1-4.el6   rhui-REGION-rhel-server-releases 680 k
 libnotify         x86_64 0.5.0-1.el6    rhui-REGION-rhel-server-releases  35 k
 libsndfile        x86_64 1.0.20-5.el6   rhui-REGION-rhel-server-releases 233 k
 libwnck           x86_64 2.28.0-3.el6   rhui-REGION-rhel-server-releases 334 k
 notification-daemon
                   x86_64 0.5.0-1.el6    rhui-REGION-rhel-server-releases  69 k
 pulseaudio-libs   x86_64 0.9.21-26.el6  rhui-REGION-rhel-server-releases 463 k
 sgml-common       noarch 0.6.3-33.el6   rhui-REGION-rhel-server-releases  43 k
 sound-theme-freedesktop
                   noarch 0.7-3.el6      rhui-REGION-rhel-server-releases 388 k
 startup-notification
                   x86_64 0.10-2.1.el6   rhui-REGION-rhel-server-releases  37 k
 system-gnome-theme
                   noarch 60.0.2-1.el6   rhui-REGION-rhel-server-releases  11 k
 system-icon-theme noarch 6.0.0-2.el6    rhui-REGION-rhel-server-releases 112 k

Transaction Summary
================================================================================
Install      33 Package(s)

```

## edit /var/kerberos/krb5kdc/kdc.conf change   REALM and add max_life and max_rebewable
```
[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
 HARSHAL.COM = {
  #master_key_type = aes256-cts
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
  max_life = 1d
  max_renewable_life = 7d
 }
```
## Edit /etc/krb5.conf file as below
```
[root@ip-10-0-3-7 ~]# vi /etc/krb5.conf 
[root@ip-10-0-3-7 ~]# cat /etc/krb5.conf 
[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 default_realm = HARSHAL.COM
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 udp_preference_limit = 1
 default_tgs_enctypes = arcfour-hmac
 default_tkt_enctypes = arcfour-hmac
[realms]
 HARSHAL.COM = {
  kdc = ip-10-0-3-7.ec2.internal
  admin_server = ip-10-0-3-7.ec2.internal
 }

[domain_realm]
 .example.com = HARSHAL.COM
 example.com = HARSHAL.COM
[root@ip-10-0-3-7 ~]# 
```
## Copy the /etc/krb5.conf to all the clients
```
[root@ip-10-0-3-7 ~]# for i in `cat ~/hosts`; do echo $i; scp /etc/krb5.conf $i:/etc/;done
10.0.3.7
krb5.conf                                                                                                                             100%  556     0.5KB/s   00:00    
10.0.3.37
krb5.conf                                                                                                                             100%  556     0.5KB/s   00:00    
10.0.3.90
krb5.conf                                                                                                                             100%  556     0.5KB/s   00:00    
10.0.3.95
krb5.conf                                                                                                                             100%  556     0.5KB/s   00:00    
10.0.3.235
krb5.conf                                                                                                                             100%  556     0.5KB/s   00:00    
[root@ip-10-0-3-7 ~]# 
```
## Create Kerberos Database
```
[root@ip-10-0-3-7 ~]# /usr/sbin/kdb5_util create -s
Loading random data
Initializing database '/var/kerberos/krb5kdc/principal' for realm 'HARSHAL.COM',
master key name 'K/M@HARSHAL.COM'
You will be prompted for the database Master Password.
It is important that you NOT FORGET this password.
Enter KDC database master key: 
Re-enter KDC database master key to verify: 
[root@ip-10-0-3-7 ~]# 
```

## Create cloudera manager user
[root@ip-10-0-3-7 ~]# kadmin.local 
Authenticating as principal root/admin@HARSHAL.COM with password.
kadmin.local:  addprinc cloudera-scm@HARSHAL.COM
WARNING: no policy specified for cloudera-scm@HARSHAL.COM; defaulting to no policy
Enter password for principal "cloudera-scm@HARSHAL.COM": 
Re-enter password for principal "cloudera-scm@HARSHAL.COM": 
Principal "cloudera-scm@HARSHAL.COM" created.

## Add privileges for cloudera-scm user to add principles in ACL
[root@ip-10-0-3-7 ~]# vi /var/kerberos/krb5kdc/kadm5.acl 
[root@ip-10-0-3-7 ~]# cat /var/kerberos/krb5kdc/kadm5.acl
*/admin@HARSHAL.COM	*
cloudera-scm@HARSHAL.COM	*
[root@ip-10-0-3-7 ~]# 

## Add password policy to the kerberos database

[root@ip-10-0-3-7 ~]# kadmin.local 
Authenticating as principal root/admin@HARSHAL.COM with password.
kadmin.local:  addpol admin
kadmin.local:  addpol users
kadmin.local:  addpol hosts
kadmin.local:  exit
[root@ip-10-0-3-7 ~]# 

## Start Kerberos services on KDC server

[root@ip-10-0-3-7 ~]# service krb5kdc start
Starting Kerberos 5 KDC:                                   [  OK  ]
[root@ip-10-0-3-7 ~]# service kadmin start
Starting Kerberos 5 Admin Server:                          [  OK  ]
[root@ip-10-0-3-7 ~]# 

## Enable Kerberos on CM
Administration --> Security --> Enable Kerberos 

Follow the wizard ... leave enable krb5.conf management through CM unchecked. 



