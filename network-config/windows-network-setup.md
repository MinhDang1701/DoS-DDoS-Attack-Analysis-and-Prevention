# Network Configuration — Windows (Victim)

## VM Information
- Operating System: Windows
- Role: Victim — runs the Python HTTP Server (port 8000) and Windows Firewall (defensive measure)
- Virtualization Platform: Oracle VM VirtualBox

## Network Adapter
- Mode: **Internal Network**
- Internal network name: `intnet-lab` (must match Kali Linux)

## Static IP Address
| Parameter | Value |
|---|---|
| IP Address | 192.168.100.20 |
| Subnet Mask | 255.255.255.0 (/24) |
| Gateway | Not required (isolated internal network) |

## Static IP Configuration (Windows)

1. Control Panel → Network and Sharing Center → Change adapter settings
2. Right-click the Internal Network interface → Properties → Internet Protocol Version 4 (TCP/IPv4) → Properties
3. Enter:
   - IP address: `192.168.100.20`
   - Subnet mask: `255.255.255.0`
4. Click OK to apply.

Or use PowerShell (Run as Administrator):

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.100.20 -PrefixLength 24
```

## Verifying Connectivity to the Kali Attacker Machine

```powershell
ping 192.168.100.10
```

## Confirming the Service Port

After starting the Python HTTP Server (see `commands/start_http_server.sh`), verify that port 8000 is listening:

```powershell
netstat -ano | findstr :8000
```
