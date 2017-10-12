## Setup JAVA_HOME and PATH variable

[root@ip-10-0-3-7 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-7 ~]# export PATH=$JAVA_HOME/bin:$PATH


## Create a Directory for ssl certificates

[root@ip-10-0-3-7 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-7 ~]# 

## Create Java Key store and Certificate signing request

### Java Key Store
[root@ip-10-0-3-7 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-server.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-7 ~]# 

### Certificate Signing request
[root@ip-10-0-3-7 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-server.jks -file /opt/cloudera/security/pki/$(hostname -f)-server.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-7 ~]#

## Get the CSR and send it to CA to provide ssl certificate

[root@ip-10-0-3-7 ~]# cat /opt/cloudera/security/pki/ip-10-0-3-7.ec2.internal-server.csr 
-----BEGIN NEW CERTIFICATE REQUEST-----
MIIC5DCCAcwCAQAwbzELMAkGA1UEBhMCVVMxDzANBgNVBAgTBkthbnNhczEUMBIG
A1UEBxMLS2Fuc2FzIENpdHkxFjAUBgNVBAoTDVlvdGFiaXRlcyBMTEMxITAfBgNV
BAMTGGlwLTEwLTAtMy03LmVjMi5pbnRlcm5hbDCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAJMc89EUiMeQETBKflgCj2h7nd8su/siPLoF6hWA3/wazlZE
N0et1H0TM8US69OyrN/hjboPHTEWH0O6j6ohNQ2bhm3KpuyDBMN4wVr0gp320LpR
wt1SeXmDp19hYUx9wQm2pebkKZHR0jQIZdbz8TKPWmNxSwQUs7K87NJDOqKuBGOO
WiqY52Udd+dUt38gR6M3L1ad5fa3KnkieLxMS/NEkuKfKtuGegTnuzTxVrqhGum6
ogG1Fh5C48PZAyPSD9d8QDbJe5NbixwRySD8L5e5GnTOmb0CRd43fzj28AHYeqTB
PKT4PirUkBB15GICA2CXTZASLIgh6tkWZxvV1hsCAwEAAaAwMC4GCSqGSIb3DQEJ
DjEhMB8wHQYDVR0OBBYEFH1TgxzaPDVlx1dStPs1lePOMsvOMA0GCSqGSIb3DQEB
CwUAA4IBAQAPQ//QpOkEnE+BhIhCI2d0poajTxYFVyJ1SL8hd+wCztyBBT+GQWJH
yRJm1dFEoU7ArZnjPLcpG2GY6vtM+O70vUtwpMJ9bLFnx+RT/vUGt81ud7SOH5kP
2/r0mtBtJPprCUVPXKq8cFAdRP/CSKPkIP7nVOqneJn6Kp+gkoOGfnZgIBZe/Ccj
xiRuAUaJLF8H6JhnRNIxOV4dtpusgoA2cF460tI7CdPf65hDeQilwzQHDqVh2njk
TvvjqrtHsnD18Gy8EguNM49kFBPOfnGHpTTr86f7N81wToIki6aF2y1Hp2IhBTSu
Zdv3rfdHAtxW3IoMS2JbO8giXHqnBVz2
-----END NEW CERTIFICATE REQUEST-----
[root@ip-10-0-3-7 ~]# 



