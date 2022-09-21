# Evil Box - 104.39.246.46

Starting Nmap 7.80 ( https://nmap.org ) at 2022-09-08 18:57 EDT
Nmap scan report for 104.39.246.46
Host is up (0.0013s latency).
Not shown: 998 closed ports
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
80/tcp open  http    Apache httpd 2.4.38 ((Debian))
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

- ssh
* password authenticated
* openssh 7.9

- web server
* running default apache page
* gobuster discovered secret, robots, server-status

# Jangow - 104.39.39.12

Starting Nmap 7.80 ( https://nmap.org ) at 2022-09-08 18:57 EDT
Nmap scan report for 104.39.39.12
Host is up (0.00057s latency).
Not shown: 998 filtered portsi
PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
80/tcp open  http    Apache httpd 2.4.18
Service Info: Host: 127.0.0.1; OS: Unix

- has ftp open, file share
- web server
* running unconfigured start bootstrap theme
* gobuster didn't discover anythign significant, site, server-status etc
* busque button looks sus as hell, there's php we can def work with

- busque.php
* ran sqlmap neither url was injectable

- ftp shar
* running vsftpd
* password authenticated
* used hydra to run a bruteforc/site/busque.php?buscar=e attack on the ftp share feeding it a wordlist of usernames and passw
