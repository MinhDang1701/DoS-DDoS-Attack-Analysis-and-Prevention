# Figure 2.1. Architecture of the Project's Virtualized Environment

```
┌──────────────────────────────────────────────────────────────┐
│                     Oracle VM VirtualBox Host                    │
│                                                                    │
│  ┌────────────────────────┐      ┌────────────────────────┐    │
│  │   VM: Kali Linux           │      │   VM: Windows               │    │
│  │   (Attacker)                 │      │   (Victim)                   │    │
│  │  ┌───────────────────┐  │      │  ┌───────────────────┐  │    │
│  │  │ Hping3               │  │      │  │ Python HTTP Server    │  │    │
│  │  │ (SYN / UDP Flood)     │  │      │  │ (port 8000)             │  │    │
│  │  ├───────────────────┤  │      │  ├───────────────────┤  │    │
│  │  │ LOIC                  │  │      │  │ Windows Firewall        │  │    │
│  │  │ (HTTP Flood)          │  │      │  │ (defense / rules)       │  │    │
│  │  ├───────────────────┤  │      │  └───────────────────┘  │    │
│  │  │ Wireshark              │  │      │                              │    │
│  │  │ (packet capture)      │  │      │                              │    │
│  │  └───────────────────┘  │      │                              │    │
│  └───────────┬────────────┘      └───────────┬────────────┘    │
│              │                                       │                    │
│              └───────────► Internal Network ◀────────┘                    │
│                            ("intnet-lab")                                 │
└──────────────────────────────────────────────────────────────┘
```

This diagram shows the internal architecture of the virtualized environment. Both virtual machines run on a single physical host under Oracle VM VirtualBox and communicate exclusively through an Internal Network. The Kali Linux VM hosts all attack-generation and traffic-analysis tools, while the Windows VM hosts the target service and the firewall-based defensive control.
