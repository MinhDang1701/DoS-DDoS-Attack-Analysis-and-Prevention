# Network Configuration — Kali Linux (Attacker)

## VM Information
- Operating System: Kali Linux
- Role: Attacker (source of attack traffic) and packet-capture host (Wireshark)
- Virtualization Platform: Oracle VM VirtualBox

## Network Adapter
- Mode: **Internal Network**
- Internal network name: `intnet-lab`
- Rationale: fully isolates all experimental traffic from the real network / Internet

## Static IP Address
| Parameter | Value |
|---|---|
| IP Address | 192.168.100.10 |
| Subnet Mask | 255.255.255.0 (/24) |
| Gateway | Not required (isolated internal network) |

## Static IP Configuration Commands (example, depends on Kali version / NetworkManager)

```bash
# List available interfaces
ip a

# Temporarily assign a static IP to an interface (e.g., eth1)
sudo ip addr add 192.168.100.10/24 dev eth1
sudo ip link set eth1 up
```

## Verifying Connectivity to the Windows Victim Machine

```bash
ping -c 4 192.168.100.20
```

Expected result: consistent replies from 192.168.100.20, confirming that the Internal Network is functioning correctly before proceeding with the attack scenarios.
