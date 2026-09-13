# Windows Firewall Rule — Block Inbound TCP Port 8000

**Applied on:** Windows (Victim) — 192.168.100.20
**Purpose:** Block TCP traffic (covering both SYN Flood and HTTP Flood) directed at the Python HTTP Server on port 8000.

## Rule Parameters

| Field | Value |
|---|---|
| Name | `DoS-Lab Block HTTP 8000` |
| Direction | Inbound |
| Action | Block |
| Protocol | TCP |
| Local Port | 8000 |
| Remote Address | 192.168.100.10 (Kali attacker) |
| Profile | Domain / Private / Public (as applicable to the VM configuration) |
| Logging | Dropped-packet logging enabled (pfirewall.log) |

## Creating the Rule via GUI (Windows Defender Firewall with Advanced Security)

1. Open **Windows Defender Firewall with Advanced Security**.
2. Select **Inbound Rules** → **New Rule…**
3. Rule Type: **Port**
4. Protocol: **TCP**, Specific local ports: `8000`
5. Action: **Block the connection**
6. Profile: select all (Domain, Private, Public)
7. Name: `DoS-Lab Block HTTP 8000`

## Creating the Rule via PowerShell (equivalent)

```powershell
New-NetFirewallRule -DisplayName "DoS-Lab Block HTTP 8000" `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 8000 `
  -RemoteAddress 192.168.100.10 `
  -Action Block
```

## Enabling Logging for Dropped Packets

```powershell
Set-NetFirewallProfile -LogBlocked True -LogFileName "%SystemRoot%\System32\LogFiles\Firewall\pfirewall.log"
```

## Verification

On Kali, after enabling the rule:

```bash
curl http://192.168.100.20:8000
# Expected result: "Connection timed out"
```

On Windows, check the log:

```powershell
Get-Content "$env:SystemRoot\System32\LogFiles\Firewall\pfirewall.log" -Tail 20
```

Expected result: `DROP` entries appear for TCP traffic (including TCP SYN packets) from `192.168.100.10` to `192.168.100.20:8000` — confirming that the rule is effective against both the HTTP Flood and SYN Flood scenarios.
