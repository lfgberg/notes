## Scenario
1. My admin account has been compromised, an attacker is going to use this to login via ssh/rdp, can we find their session and kick them off?
2. They have now adapted a bit and are accessing the machine via winrm, can we find them?
3. They decided to create a new user, and established some form of persistence, can we find it?
### SSH
* run `query user` you won't see it
* Checkout `Task Manager > Users` it won't be there
* EID 4624 for user logon will be just shown as system
* `Event Viewer > Application and Services Logs > OpenSSH > Operational` to show SSH logins user, ip, and port
* ProcessExplorer will show the user dir and process
* netstat/tcpview/etc shows the connection as well
### RDP
* Can be seen and disconnected in task manager
* Can be seen with `query user`
* connection will be seen w/ netstat/tcpview etc
* `query user` > `logoff [ID]`
* Generates normal logon 4624 event
### WinRM / PSExec
* Shows up in `Application and Services Logs > Windows > Windows Remote Management > Operational`
* Can find the affected user and cycle creds
* remove if able
* check transcripts
### Windows Reverse Shell Hunting
1. Create a scheduled task to run netcat
2. view in tcpview
3. examine parent in procexp to see scheduled
4. look for task
5. find proof
## Linux
### SSH
1. login
2. w + awfux
3. kill
4. change passwd
5. examine history
6. erm
### Reverse Shell
1. ps awfux
2. find binary
3. DIE DIE DIE