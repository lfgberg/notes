# Machines
## Scope - 10.10.110.0/24
### .3 - Windows DC01-PHOBOS
#### nmap
53/tcp   open  domain?
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2022-09-16 04:18:15Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: genesis.local0., Site: Default-First-Site-Name)
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  tcpwrapped
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: genesis.local0., Site: Default-First-Site-Name)
3269/tcp open  tcpwrapped
### .5 - Windows
#### nmap
135/tcp   open     msrpc         Microsoft Windows RPC
139/tcp   open     netbios-ssn   Microsoft Windows netbios-ssn
445/tcp   open     microsoft-ds?
4129/tcp  filtered nuauth
8300/tcp  filtered tmi
8654/tcp  filtered unknown
57294/tcp filtered unknown
### .10 - Ubuntu
#### nmap
22/tcp   open  ssh     OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.13 (Ubuntu Linux; protocol 2.0)
3306/tcp open  mysql   MySQL 5.5.62-0ubuntu0.14.04.1
#### mysql
* attempted to use a [metasploit module](https://www.rapid7.com/db/modules/auxiliary/scanner/mysql/mysql_authbypass_hashdump/) to bypass authentication
### .12 - Ubuntu
#### nmap
21/tcp open  ftp     vsftpd 3.0.5
22/tcp open  ssh     OpenSSH 8.9p1 Ubuntu 3 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.52 ((Ubuntu))
#### ftp
* allows anonymous login
#### Web App
* direct access to /documents
* contians a template.ovpn
### .20 - Windows
#### nmap
21/tcp  open  ftp           Microsoft ftpd
135/tcp open  msrpc         Microsoft Windows RPC
139/tcp open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp open  microsoft-ds?
#### ftp
* allows anonymous login
* downloaded pentest_report.txt
* test/t3st123
* print nightmare!
#### smt
### .25
#### nmap
135/tcp open  msrpc
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds
### .45
#### nmap
22/tcp open  ssh
80/tcp open  http
| http-title: Beta Login
|_Requested resource was http://10.10.110.45/login/
### .58 - Windows Server 2016 6.3 SQL01-HERA
#### nmap
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
1433/tcp open  ms-sql-s
| ms-sql-ntlm-info: 
|   Target_Name: SQL01-HERA
|   NetBIOS_Domain_Name: SQL01-HERA
|   NetBIOS_Computer_Name: SQL01-HERA
|   DNS_Domain_Name: SQL01-Hera
|   DNS_Computer_Name: SQL01-Hera
|_  Product_Version: 10.0.14393
| ssl-cert: Subject: commonName=SSL_Self_Signed_Fallback
| Not valid before: 2022-09-13T09:37:46
|_Not valid after:  2052-09-13T09:37:46
|_ssl-date: 2022-09-16T00:44:05+00:00; +5s from scanner time.
### .60
#### nmap
22/tcp open  ssh
80/tcp open  http
### .78
#### nmap
22/tcp   open  ssh
6123/tcp open  backup-express
8081/tcp open  blackice-icecap
### .102
#### nmap
22/tcp   open  ssh
8080/tcp open  http-proxy
| http-robots.txt: 1 disallowed entry 
|_/
|_http-title: Dashboard [Jenkins]
### .119
21/tcp open  ftp
22/tcp open  ssh
80/tcp open  http
|_http-generator: WordPress 5.7
|_http-title: Genesis Security &#8211; All things Genesis
### .205 - Ubuntu 22.04 Zeus
#### webapp
* Local File Inclusion (LFI)
* can pass "/etc/passwd" to blog.php?article
* uses php backend
* feroxbuster -x php to fuzz for php files > db.php
* inspect element ->
* $servername = "localhost";
* $username = "panos";
* $password = "supersecretpassword";
#### user
* logged in over ssh with found creds
* sudo -l to see we can run /bin/bash as sudo
* add ssh key to authorized keys so we can be a gamer
* rooted
### .213 - Windows Server 2008 R2
#### nmap
80/tcp    open  http         Apache httpd 2.4.37 ((Win32) OpenSSL/1.0.2p PHP/5.6.39)
135/tcp   open  msrpc        Microsoft Windows RPC
139/tcp   open  netbios-ssn  Microsoft Windows netbios-ssn
443/tcp   open  ssl/http     Apache httpd 2.4.37 ((Win32) OpenSSL/1.0.2p PHP/5.6.39)
445/tcp   open  microsoft-ds Microsoft Windows Server 2008 R2 - 2012 microsoft-ds
49152/tcp open  msrpc        Microsoft Windows RPC
49153/tcp open  msrpc        Microsoft Windows RPC
49154/tcp open  msrpc        Microsoft Windows RPC
49155/tcp open  msrpc        Microsoft Windows RPC
49156/tcp open  msrpc        Microsoft Windows RPC
49157/tcp open  msrpc        Microsoft Windows RPC
49160/tcp open  msrpc        Microsoft Windows RPC
#### Genesis Security Webapp
* has a contact form

### .254
### nmap
53/tcp open  domain  (generic dns response: REFUSED)
80/tcp open  http    nginx
