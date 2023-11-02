## Introduction Challenge
* There is a flag hidden on the web page of this challenge
![[Pasted image 20231101182914.png]]
* Inspect element, it's at the bottom
![[Pasted image 20231101183034.png]]
## WEAK CRYPTO
```
We were recently hacked, so we needed to take our entire login application offline. All users who access the site are forced to be anonymous users only based on their session token.  
  
Can you verify that our fix is effective?  
  
**Note:** The login functionality and form are actually disabled, there is no brute forcing required to solve this challenge; focus on the session token
```
![[Pasted image 20231101183457.png]]
* admin panel we can't login to
![[Pasted image 20231101183717.png]]
* verify user page shows us as "user" `/api/user`
![[Pasted image 20231101183627.png]]
* stores a session token, JWT format
![[Pasted image 20231101184036.png]]
* token decodes to anonymous
* edit the token to administrator
* browse to `/api/user`
![[Pasted image 20231101184506.png]]
## DEFAULT ADMINISTRATOR PASSWORD
* It seems that someone forgot to change their vendor default password, can you find it?
![[Pasted image 20231101185448.png]]
* Default apache geronimo creds are `system/manager`
![[Pasted image 20231101185612.png]]
## Call an Ambulance
* Our server is vulnerable to a well known attack. What was it called? Shellshock? Poodle?
```
47238/tcp open  ssl/http nginx 1.5.12  
| tls-nextprotoneg:    
|_  http/1.1  
|_http-server-header: nginx/1.5.12  
|_ssl-date: TLS randomness does not represent time  
| ssl-cert: Subject: commonName=10.1.2.8/organizationName=DeloitteCTF/countryName=US  
| Not valid before: 2015-02-20T13:57:08  
|_Not valid after:  2015-02-27T13:57:08  
|_http-title: Did not follow redirect to https://10.6.0.2:47238/
```
* secure test server on 47238, heartbleed
* msf scanner/ssl/openssl_heartbleed
	* set verbose true
	* exploit
	* shows flag in traffic
## EVIL EVAL
* Allowing users to eval() JavaScript should be fine right?
![[Pasted image 20231101194920.png]]
* let's us run limited eval code
* html += XXX allows us to get visual output
* we can run commands with execSync
* `html += require("child_process").execSync('find / --name flag*').toString();` finds the flag file recursively
* `html += require("child_process").execSync('cat /src/flag.txt').toString();` outputs the flag
![[Pasted image 20231101195735.png]]
## SIMPLE NSLOOKUP TOOL V2
```
Version 1 of our nslookup tool was vulnerable to command injection. As a fix I blocked the common command execution tricks (;&$><`\!).  
  
Can you test version 2 for me and make sure it is not possible to call any other binaries?
```

![[Pasted image 20231101195956.png]]
* they don't blacklist pipes
![[Pasted image 20231101200034.png]]
![[Pasted image 20231101200100.png]]
## THE KEY IS IN MY PASS
```
We recently conducted a raid on the supposed leader of the Zalophus botnet.  
Unfortunately, he managed to lock his computer just as we arrived and refuses to unlock it.  
Our forensics team managed to take a memory dump of the machine before it was shut down.  
Is there any information in this dump that we missed?
```
* mem.dmp file
* going to analyze with volatility
![[Pasted image 20231101213635.png]]
![[Pasted image 20231101213833.png]]
![[Pasted image 20231101221435.png]]
![[Pasted image 20231101215716.png]]