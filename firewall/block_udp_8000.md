# Windows Firewall Rule — Block Inbound UDP Port 8000

**Applied on:** Windows (Victim) — 192.168.100.20
**Purpose:** Block UDP traffic directed at port 8000 (UDP Flood scenario).

## Rule Parameters

| Field | Value |
|---|---|
| Name | `DoS-Lab Block UDP 8000` |
| Direction | Inbound |
| Action | Block |
| Protocol | UDP |
| Local Port | 8000 |
| Profile | Domain / Private / Public |

## Creating the Rule via PowerShell

```powershell
New-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" `
  -Direction Inbound `
  -Protocol UDP `
  -LocalPort 8000 `
  -Action Block
```

## Verification Limitation (important — consistent with the report)

In this lab environment, **no UDP service actually listens on port 8000** (only the TCP-based Python HTTP Server is running). Consequently:

- The UDP rule was **successfully configured and enabled** (confirmed at the rule level — `Get-NetFirewallRule` shows `Enabled: True`).
- **No** specific DROP log entry was obtained for UDP traffic, since there is no UDP service for the traffic to reach and be logged as rejected against.
- Therefore, UDP defense is reported in the project as **"rule-level validation only"** (configuration-level verification, without full log-based evidence as in the TCP case).

## Confirming the Rule Is Enabled

```powershell
Get-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" | Select DisplayName, Enabled, Direction, Action
```
