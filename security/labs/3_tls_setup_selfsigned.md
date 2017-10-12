## Create Directories and change the ownership

```
[ec2-user@ip-10-0-3-7 ~]$ sudo su -
[root@ip-10-0-3-7 ~]# mkdir -p /opt/cloudera/security/x509/ /opt/cloudera/security/jks/
[root@ip-10-0-3-7 ~]# chown cloudera-scm:cloudera-scm /opt/cloudera/security/x509/ /opt/cloudera/security/jks/

```

## Generate Key Stores

```
[root@ip-10-0-3-7 ~]# cd /opt/cloudera/security/jks/
[root@ip-10-0-3-7 jks]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-7 jks]# keytool -genkeypair -keystore harshal.keystore -keyalg RSA -alias cmhost -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-7 jks]# 

```

## Copy CACerts to jssecacerts
```
[root@ip-10-0-3-7 jks]# cp $JAVA_HOME/jre/lib/security/cacerts $JAVA_HOME/jre/lib/security/jssecacerts
[root@ip-10-0-3-7 jks]#
``` 

## Generate Selfsigned certificate

```
[root@ip-10-0-3-7 jks]# keytool -export -alias cmhost -keystore harshal.keystore -rfc -file $(hostname -f).cer
Enter keystore password:  
Certificate stored in file <ip-10-0-3-7.ec2.internal.cer>
[root@ip-10-0-3-7 jks]# 

``` 

## Copy the self-signed certificate to the /opt/cloudera/security/x509/ directory. 

```
[root@ip-10-0-3-7 jks]# cp ip-10-0-3-7.ec2.internal.cer /opt/cloudera/security/x509/cmhost.pem
[root@ip-10-0-3-7 jks]# 
```

## Import the public key into the alternate system truststore (jssecacerts)

```
[root@ip-10-0-3-7 jks]# keytool -import -alias cmhost -file /opt/cloudera/security/jks/$(hostname -f).cer -keystore $JAVA_HOME/jre/lib/security/jssecacerts -storepass changeit
Owner: CN=ip-10-0-3-7.ec2.internal, O=Yotabites LLC, L=Kansas City, ST=Kansas, C=US
Issuer: CN=ip-10-0-3-7.ec2.internal, O=Yotabites LLC, L=Kansas City, ST=Kansas, C=US
Serial number: 5d9ddafa
Valid from: Thu Oct 12 16:48:18 UTC 2017 until: Wed Jan 10 16:48:18 UTC 2018
Certificate fingerprints:
	 MD5:  ED:95:F5:84:21:AC:66:80:66:FE:2B:59:2B:B9:C0:62
	 SHA1: E4:F8:55:EE:5A:02:84:53:E3:80:3B:C7:AB:0A:3E:99:4D:6D:05:F3
	 SHA256: 3F:F3:59:C2:D2:D1:34:4C:78:EE:A1:43:B8:D7:9A:03:5F:F2:9A:E9:ED:B4:96:44:96:EA:82:3E:59:F8:68:26
	 Signature algorithm name: SHA256withRSA
	 Version: 3

Extensions: 

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: E2 B8 92 83 D3 C2 CB 5E   A6 37 A2 C1 72 0C B9 B2  .......^.7..r...
0010: 51 A7 56 58                                        Q.VX
]
]

Trust this certificate? [no]:  yes
Certificate was added to keystore
[root@ip-10-0-3-7 jks]# 

```

## Rename the keystore and remove .cer certificate
```
[root@ip-10-0-3-7 jks]# mv /opt/cloudera/security/jks/harshal.keystore /opt/cloudera/security/jks/cmhost-keystore.jks
[root@ip-10-0-3-7 jks]# rm /opt/cloudera/security/jks/ip-10-0-3-7.ec2.internal.cer 
rm: remove regular file `/opt/cloudera/security/jks/ip-10-0-3-7.ec2.internal.cer'? y
[root@ip-10-0-3-7 jks]# 

```

## Setup TLS-1

CM --> Administration --> Settings --> Security --> Use TLS Encryption for Admin Console --> Enable 


Cloudera Manager TLS/SSL Server JKS Keystore File Location  /opt/cloudera/security/jks/cmhost-keystore.jks

Cloudera Manager TLS/SSL Server JKS Keystore File Password  changeit

Cloudera Manager TLS/SSL Certificate Trust Store File       /usr/java/latest/jre/lib/security/jssecacerts

Cloudera Manager TLS/SSL Certificate Trust Store Password   changeit

## Restart the Cloudera Manager server
```
[root@ip-10-0-3-7 jks]# service cloudera-scm-server restart
```

