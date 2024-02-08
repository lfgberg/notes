## Windows
### Services
```powershell
New-Service -Name WinStart -DisplayName WinStart -BinaryPathName "C:\Windows\System32\svchst.exe" -StartupType Automatic
```
### Users
```cmd
net user EnterpriseAdmin 3rm@ctually! /add
net localgroup Administrators EnterpriseAdmin /add
net group "Domain Admins" EnterpriseAdmin /add
```
### PowerShell Popup
```powershell
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Erm", "Erm", [System.Windows.MessageBoxButton]::Ok, [System.Windows.MessageBoxImage]::Error)
```
### Firewall Rules
```powershell
New-NetFirewallRule -DisplayName "Erm" -Direction Inbound -Protocol TCP -LocalPort 69 -Action Block
New-NetFirewallRule -DisplayName "Erm" -Direction Inbound -Protocol UDP -LocalPort 69 -Action Block
```
```cmd
netsh advfirewall firewall add rule name="Erm!" dir=in action=block protocol=ICMPv4
netsh advfirewall firewall add rule name="Block Port 12345" dir=in action=block protocol=TCP localport=12345

```
### Services
```powershell
Restart-Service [service name]
```
## Linux
### Iptables
```bash
sudo iptables -A INPUT -p tcp --dport 69 -j DROP
```
### Make a ton of users
```bash
for i in {1..100}; do sudo useradd user$i -m -p $(openssl passwd -1 initialpassword); done
```