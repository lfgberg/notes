## Infra
1. Setup network w/default settings
![[network.png]]
2. Setup firewalls rules on public subnet
* added ingress rules to allow 80,443, and my sliver port
![[ingress-rules.png]]
3. Spin up always free instance
![[image.png]]
![[ssh.png]]
4. Install sliver
* compile from source
5. Configure the sliver server
* update config file with port
```json
{
    "daemon_mode": true,
    "daemon": {
        "host": "",
        "port": [lport]
    },
    "logs": {
        "level": 4,
        "grpc_unary_payloads": false,
        "grpc_stream_payloads": false,
        "tls_key_logger": false
    },
    "jobs": {
        "multiplayer": true
    },
    "watch_tower": null,
    "go_proxy": ""
}
```
* configure service
* enable service
* reload service `systemctl restart sliver`
1. Configure operators
* `./sliver-server operator --name [name] --lhost [pub ip] --save [name].cfg --lport [lport]`
2. configure firewall
3. Connect and enjoy!
![[sliver-connection.png]]