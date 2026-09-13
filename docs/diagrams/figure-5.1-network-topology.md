# Figure 5.1. Experimental Network Diagram: Kali Linux (Attacker) and Windows (Victim) Connected via a VirtualBox Internal Network

```
                  VirtualBox Internal Network: "intnet-lab"
                  (fully isolated — no external/Internet routing)

 ┌────────────────────────────┐              ┌────────────────────────────┐
 │  Kali Linux (Attacker)         │              │  Windows (Victim)               │
 │  IP: 192.168.100.10/24         │◀────────────▶│  IP: 192.168.100.20/24          │
 │                                    │              │                                    │
 │  Tools:                            │              │  Services:                          │
 │   - Hping3 (SYN / UDP Flood)       │              │   - Python HTTP Server (TCP 8000)   │
 │   - LOIC (HTTP Flood)              │              │                                    │
 │   - Wireshark (packet capture)     │              │  Defense:                           │
 │                                    │              │   - Windows Firewall (Inbound Block │
 │                                    │              │     rules on TCP/UDP port 8000)     │
 └────────────────────────────┘              └────────────────────────────┘
```

This diagram details the physical/logical network layout used throughout the experiments. Both virtual machines are connected exclusively through the VirtualBox Internal Network `intnet-lab`, with static IP addresses 192.168.100.10 (Kali, Attacker) and 192.168.100.20 (Windows, Victim). The Python HTTP Server listening on TCP port 8000 serves as both the target service for HTTP Flood and the protocol/port targeted by the SYN Flood and UDP Flood scenarios, while Windows Firewall provides the local defensive control evaluated in Chapter 5.
