## Setup JAVA_HOME and PATH variable
```
[root@ip-10-0-3-7 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-7 ~]# export PATH=$JAVA_HOME/bin:$PATH
```

## Create a Directory for ssl certificates
```
[root@ip-10-0-3-7 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-7 ~]# 
```
## Create Java Key store and Certificate signing request

### Java Key Store
```
[root@ip-10-0-3-7 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-server.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-7 ~]# 
```
### Certificate Signing request
```
[root@ip-10-0-3-7 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-server.jks -file /opt/cloudera/security/pki/$(hostname -f)-server.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-7 ~]#
```
## Get the CSR and send it to CA to provide ssl certificate
```
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
```
## Create JKS and CSR on agent server
```
10.0.3.37
Last login: Wed Oct 11 19:16:16 2017 from ip-10-0-3-7.ec2.internal
[root@ip-10-0-3-37 ~]# ^C
[root@ip-10-0-3-37 ~]# ^C
[root@ip-10-0-3-37 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-37 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-37 ~]# export PATH=$JAVA_HOME/bin:$PATH
[root@ip-10-0-3-37 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-37 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -file /opt/cloudera/security/pki/$(hostname -f)-agent.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-37 ~]# cat /opt/cloudera/security/pki/$(hostname -f)-agent.csr
-----BEGIN NEW CERTIFICATE REQUEST-----
MIIC5TCCAc0CAQAwcDELMAkGA1UEBhMCVVMxDzANBgNVBAgTBkthbnNhczEUMBIG
A1UEBxMLS2Fuc2FzIENpdHkxFjAUBgNVBAoTDVlvdGFiaXRlcyBMTEMxIjAgBgNV
BAMTGWlwLTEwLTAtMy0zNy5lYzIuaW50ZXJuYWwwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQC2UooP+wkEPUATZxWx5ud17m2tQ6IFzyVIUwpDAKA7jweT
L4GZ+kXv/X0ZuA1dWHd3+zV8qMD47VF20FdIy8UNbuPfKjZQBXawjQpPoSJ7tbZD
0zC0RxApqhiaT5I2IyOLkfYq6IrUW7A/sbhV4lzeUHqoLQs7GUFgAm0rUdK6URau
wzOWntSNhMU8uefAD5t9LQaAPC2egliWi+suKaoOpD7HQFShIs2swc2JOnrwjS2f
UqcNqsIgSb0KrdyuaAiCKf6wOiqpA/Lj5Dm80GTgWKUZJKumECibBRxTWqm2F+Uz
ZVA9Ka9I/WZab49v9u9mYpd98Dw7tVPRO6mzTPLDAgMBAAGgMDAuBgkqhkiG9w0B
CQ4xITAfMB0GA1UdDgQWBBSdLXkXCuMpjrA9lZ3lZIJueyWZ2zANBgkqhkiG9w0B
AQsFAAOCAQEAV0xArjo7bo8l+XPYI1tQmavernmrtv8sH3bTpmt2EniG96I2pSK9
qf4o0ePMlRZLKvi2x+EI37HolcMq9DUDfdQ1CO/74Z5MrZgAWpiYUWxONP5nUQUu
kHt44xHQO7KCHMf57N6GhNot2+98YVf6jeQhE+oC1+AxslzZKe2KCKTNCbwWZsiE
d4EibjzQYAb+ObQsld0gH0fiAJi3ZrBUDYxpFvOT7CX6o3xNImB1vMrlvGIwQMp6
40+oQPdDmMOdxYG/lDS0ifFy4wqHjCjPAks8bNVmUnEavDIVZmsabq6iE5l3PWFG
MkAczkNQJDjDsYm3kZOfsR8zlUm3h1XL3Q==
-----END NEW CERTIFICATE REQUEST-----
[root@ip-10-0-3-37 ~]# logout
Connection to 10.0.3.37 closed.
10.0.3.90
Last login: Wed Oct 11 19:16:15 2017 from ip-10-0-3-7.ec2.internal
[root@ip-10-0-3-90 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-90 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-90 ~]# export PATH=$JAVA_HOME/bin:$PATH
[root@ip-10-0-3-90 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-90 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -file /opt/cloudera/security/pki/$(hostname -f)-agent.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-90 ~]# cat /opt/cloudera/security/pki/$(hostname -f)-agent.csr
-----BEGIN NEW CERTIFICATE REQUEST-----
MIIC5TCCAc0CAQAwcDELMAkGA1UEBhMCVVMxDzANBgNVBAgTBkthbnNhczEUMBIG
A1UEBxMLS2Fuc2FzIENpdHkxFjAUBgNVBAoTDVlvdGFiaXRlcyBMTEMxIjAgBgNV
BAMTGWlwLTEwLTAtMy05MC5lYzIuaW50ZXJuYWwwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCqJXat33nM8Yj1jlR35rrgy+33RKK/tSfSUXSra85G8mVo
q49JubN1R0910lrhNfx22RlBAUqvxWj4gRp25qsP0YAjGIKpoaKFv4YEZMwbBTlE
RkjBtbzKELGnmqbu0CNLGzuD1trlJOTDPJ5tAhCfxfSHAyWOPWZGgrngvf3uHqTo
qCAa/IFox3u2lKW5ImRkANiZC9wNeaVUdzNRAlU6P+FmD6r6Ixtp20NhLokXCpvu
L0cXZlXMfV4DxzTplApI5LNqOaK4/5p4wy1ObDMU4Ocyg3vf+tzX2Hx5LIIdOZIq
AaMTMfB6V9XAajOB2bw8fkuv7HK0fcfaPy0uYMYBAgMBAAGgMDAuBgkqhkiG9w0B
CQ4xITAfMB0GA1UdDgQWBBQQvDHD5Pb4WKpskTsxLEjAgDZgtzANBgkqhkiG9w0B
AQsFAAOCAQEAW2adFMA3bnLQC5HUfim7reeUdZKx5v18SZrQ/uJpZcJ+XMuSYnqV
SnrfCp94Sy/E3aoOd2UThvHgKZQwWWfv787wDiTq5Ja7lBniNLU+HvfHcAtAL/6x
uDFXlWN1EUJE0es3qHXEmm5JRo0ejNKLEDW2loQHkt2h8gJ1Kc0V/Y3bPcJa4Gg7
TPL90zxT4ZclcUp/T1q1dVAeFzXP8+hdshe242HVMyDp8Y3BDEAd20JD3NH+gBTd
yKl9UAJ2uJxk8W9xVtSI2/ZbDTLyvYihGtYY6UGqxBglp08rB9sXuwtfgK0G37MY
K6v+kU/iXFBLw/LKIhIER5Wt2SZE4n+jFg==
-----END NEW CERTIFICATE REQUEST-----
[root@ip-10-0-3-90 ~]# logout
Connection to 10.0.3.90 closed.
10.0.3.95
Last login: Wed Oct 11 19:16:15 2017 from ip-10-0-3-7.ec2.internal
[root@ip-10-0-3-95 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-95 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-95 ~]# export PATH=$JAVA_HOME/bin:$PATH
[root@ip-10-0-3-95 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-95 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -file /opt/cloudera/security/pki/$(hostname -f)-agent.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-95 ~]# cat /opt/cloudera/security/pki/$(hostname -f)-agent.csr
-----BEGIN NEW CERTIFICATE REQUEST-----
MIIC5TCCAc0CAQAwcDELMAkGA1UEBhMCVVMxDzANBgNVBAgTBkthbnNhczEUMBIG
A1UEBxMLS2Fuc2FzIENpdHkxFjAUBgNVBAoTDVlvdGFiaXRlcyBMTEMxIjAgBgNV
BAMTGWlwLTEwLTAtMy05NS5lYzIuaW50ZXJuYWwwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCX8A+iwpM4PWXdAtAMZS42f4ezxOMrWn218eAGoIOab8md
OfhSDZezOaQYAnYXcvey4+bnXajCnZQm9SDjuzdw1bl0O3c07dhoVvfd75IyJQAL
ocARIGzEFpNSXXrcSQVZURhlFPWRiCR9m7JSoL61VNGe9Uz5x1CU+8qZFJhMl0mE
ACP0e7XHE2yZ0IIhyUuQ7XMjxvTJ1yGDrS/RF1gGoqXXT9FWcMCVfW55FWioqoVX
WnJdHZ9qCH2tA+BU/knHyk39DHW06f0VI23+h0Yb/YF+RsskYxe8SpqGT3uJp/+T
cogjNf/QNZnUQkqtJTIvlJFLpcCYL2UdPdZb3ixXAgMBAAGgMDAuBgkqhkiG9w0B
CQ4xITAfMB0GA1UdDgQWBBQU5uK+Tb3tCC65yzY/XRXDqvtplzANBgkqhkiG9w0B
AQsFAAOCAQEABJz8TFVlwsh6pvZqMVL9u0dBZAnoQOFBfEstFJoVDnM822QU6SkZ
d/RL7yvGDQgJa0shoVZe1PCidKaIWT98pwYTlCfomk7KAEz4gzy1Ls85B9nOylKn
Fll1i6PZGpp1Ls3D5dGMRphx1uLCjNF8UXmQwFyKXJYEuPPaVbNCOUNtbC5dwnkC
T8oh+myhR6VWlteRo0U3p6xOmM/3IsWXbXm1UgPSo7uOcRYD2LAubsnkXOsRbhg2
SUy1EUiALOvW1a5uAC/ceqf4gKmJUnAG6J54UIJVQ/WQgOUohCsvWhOG8bWj7a7o
x/KDDABEUIKBMJm+I37srsPMQNUgcKDkOw==
-----END NEW CERTIFICATE REQUEST-----
[root@ip-10-0-3-95 ~]# logout
Connection to 10.0.3.95 closed.
10.0.3.235
Last login: Wed Oct 11 19:16:16 2017 from ip-10-0-3-7.ec2.internal
[root@ip-10-0-3-235 ~]# mkdir -p /opt/cloudera/security/pki
[root@ip-10-0-3-235 ~]# export JAVA_HOME=/usr/java/latest
[root@ip-10-0-3-235 ~]# export PATH=$JAVA_HOME/bin:$PATH
[root@ip-10-0-3-235 ~]# keytool -genkeypair -alias $(hostname -f)-server -keyalg RSA -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -keysize 2048 -dname "CN=$(hostname -f),O=Yotabites LLC,L=Kansas City,ST=Kansas,C=US" -storepass changeit -keypass changeit
[root@ip-10-0-3-235 ~]# keytool -certreq -alias $(hostname -f)-server -keystore /opt/cloudera/security/pki/$(hostname -f)-agent.jks -file /opt/cloudera/security/pki/$(hostname -f)-agent.csr -storepass changeit -keypass changeit
[root@ip-10-0-3-235 ~]# cat /opt/cloudera/security/pki/$(hostname -f)-agent.csr
-----BEGIN NEW CERTIFICATE REQUEST-----
MIIC5jCCAc4CAQAwcTELMAkGA1UEBhMCVVMxDzANBgNVBAgTBkthbnNhczEUMBIG
A1UEBxMLS2Fuc2FzIENpdHkxFjAUBgNVBAoTDVlvdGFiaXRlcyBMTEMxIzAhBgNV
BAMTGmlwLTEwLTAtMy0yMzUuZWMyLmludGVybmFsMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAoD7TRbkaixKYXs0McNvmkKyfNdQgmCSb4Fhm3zZhDhty
wIsJbd+NhsJRNHo/u4Yq+fw2Ez74GIRdgyysWIUynPc8EPmKfvQ7UXq5HOBogZOz
rLDWkPx6k7nkj/3x3ziSKrbEbA3sJpdeB9eJo06qyDyxby/m+DS5Qb/YsC3gl4QO
1YQ49J/lCPTVz36Uv14fxprTH9afrjB9kMAjQHgw55OGsjV7C03Kg31nZ1rgH4i1
PM1G5gfbYTdgUV9i7CExMKi1A6HlPQEM4JDNdO7Q/OoNjE+mQCqMmjhIIG8ax7V4
vjDV7VNO9aq0pXnyeUhbUGO2ZEnhCTbEo8uxEX2QQwIDAQABoDAwLgYJKoZIhvcN
AQkOMSEwHzAdBgNVHQ4EFgQUQCNDOcyC2HGlgdHYDTHn9QdLZKkwDQYJKoZIhvcN
AQELBQADggEBAAb1GfeYX4A+ZFFApUmIbFzJaWK1UCThmO+BqfKtjal0SVK7lc8t
iUzn4QKbTu5Ew3GYR4HK+TwB8JxMv6bAHaZUEB+FY2mXbyRL4mu5Wrot3kRgqGyR
A0cw3B3R/R6+Frn3DdPt5tCho6Yt8BQ8oDIeR4DrYdnarxlnnXW8EslBvIxx0at1
HXddwNM5OReMnQnxJTrUivwza69qpBnRzB+zmOTjIGZmDB0krIp/rBVBV0OPSSTR
Yae3zR2D7mztvJcRnZwO9hr7gCFv+8Y4PJdId4I7XGolOHSNbSqSkuLJNmUpS+3P
53yOFz0r96D1K5JLfRVqJkNYQO89Nl/fd3E=
-----END NEW CERTIFICATE REQUEST-----
[root@ip-10-0-3-235 ~]# 
[root@ip-10-0-3-235 ~]# 
[root@ip-10-0-3-235 ~]# 
[root@ip-10-0-3-235 ~]# logout
Connection to 10.0.3.235 closed.
[root@ip-10-0-3-7 ~]# logout
[ec2-user@ip-10-0-3-7 ~]$ 
```


