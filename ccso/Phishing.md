10.10.105.51## Bypassing Link Protections
* send your link in plaintext
	* there's no hooks, so it doesn't get caught by link scanning
	* outlook still is smart enough to render it as a link
* make sure your domain isn't known bad
## Bypassing Attachment Protections
* make your attachments unscannable
	* password protected attachments
	* encrypted attachments
* make it a staged payload that gets evil later
* [remote template injection](https://john-woodman.com/posts/vba-macro-remote-template-injection/)
	* word doc points to a template at a remote address w macros
* sandbox evasion
	* restrict attack infra access
	* sleep times

## Email Spoofing
* spin up your own mail server and set the domain to be theirs
* open relay - try to relay to their smtp server
* o365 tenant smtp - o365 tenants are unauthenticated and you can spoof an email from it