## Windows SSH Example
* run `query user` you won't see it
* Checkout `Task Manager > Users` it won't be there
* EID 4624 for user logon will be just shown as system
* `Event Viewer > Application and Services Logs > OpenSSH > Operational` to show SSH logins user, ip, and port
* ProcessExplorer will show the user dir and process
* netstat/tcpview/etc shows the connection as well

## Windows RDP Example
* Can be seen and disconnected in task manager
* Can be seen with `query user`
* connection will be seen w/ netstat/tcpview etc
* `query user` > `logoff [ID]`
* Generates normal logon EIDs

## WinRM / PSExec
* Shows up in `Application and Services Logs > Windows > Windows Remote Management > Operational`
* Can find the affected user and cycle creds
* remove if able
* check transcripts

## Windows Reverse Shell Hunting
