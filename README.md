# DoS/DDoS Attack Analysis and Prevention — Lab Source & Config

**Course:** CMU-CS 376 – Elements of Network Security
**Institution:** Duy Tan University – CMU Joint-Training Program
**Student:** Dang Cong Minh — Student ID: 30211456495
**Project Title:** Denial of Service (DoS/DDoS) Attack Analysis and Prevention

> ⚠️ **WARNING / DISCLAIMER**
> All content in this repository (attack commands, configuration files) was executed **exclusively within an isolated virtualized lab environment (VirtualBox Internal Network)**, for academic and educational purposes only. **Under no circumstances** should these commands or techniques be used against any system, network, or service that you do not own or do not have explicit authorization to test. Conducting DoS/DDoS attacks against third-party systems is illegal.

---

## 1. Purpose of This Repository

This repository accompanies the technical report `30211456495_DangCongMinh_CS376_TechnologiesReport.docx` and provides:

- Attack-simulation commands (SYN Flood, UDP Flood, HTTP Flood) used during the experiments.
- Virtualized network configuration (IP addressing, Internal Network).
- Windows Firewall rule configuration used for defense, plus supporting log evidence.
- A report-structure mapping for quick cross-referencing with the report chapters/sections.

## 2. Experimental Network Topology

```
      VirtualBox Internal Network ("intnet-lab")
      (fully isolated from the external network / Internet)

┌─────────────────────┐                 ┌─────────────────────┐
│   Kali Linux         │                 │   Windows            │
│   (Attacker)         │  <──────────>   │   (Victim)            │
│   192.168.100.10/24  │                 │   192.168.100.20/24   │
│                       │                 │                       │
│  - Hping3             │                 │  - Python HTTP Server │
│  - LOIC                │                 │    (port 8000)        │
│  - Wireshark (capture) │                 │  - Windows Firewall    │
└─────────────────────┘                 └─────────────────────┘
```

## 3. Directory Structure

```
dos-ddos-lab-cs376/
├── README.md
├── network-config/
│   ├── kali-network-setup.md
│   └── windows-network-setup.md
├── commands/
│   ├── syn_flood.sh
│   ├── udp_flood.sh
│   ├── start_http_server.sh
│   └── loic_http_flood_config.md
├── firewall/
│   ├── block_tcp_8000.md
│   ├── block_udp_8000.md
│   └── sample_pfirewall.log
└── docs/
    ├── report-structure.md
    └── diagrams/
        ├── README.md
        ├── figure-1.1-scope.md
        ├── figure-1.2-workflow.md
        ├── figure-2.1-architecture.md
        ├── figure-3.1-schedule.md
        ├── figure-4.1-dos-vs-ddos.md
        ├── figure-4.2-osi-tcpip.md
        ├── figure-4.3-cc-botnet.md
        ├── figure-4.5-threshold-detection.md
        ├── figure-4.6-ids-ips.md
        ├── figure-4.7-ml-workflow.md
        ├── figure-4.8-ai-defense-cycle.md
        └── figure-5.1-network-topology.md
```

## 4. Steps to Reproduce the Three Scenarios (in your own lab environment)

1. Create two VirtualBox VMs and set both network adapters to **Internal Network** mode with the same name (`intnet-lab`).
2. Assign static IP addresses as described in `network-config/`.
3. Verify connectivity with a bidirectional `ping` test.
4. On Windows: run `commands/start_http_server.sh` (the actual command is a Python command — see file contents) to start the web server on port 8000.
5. On Kali: open Wireshark and start capturing on the internal-network interface.
6. Run each scenario in turn:
   - `commands/syn_flood.sh`
   - `commands/udp_flood.sh`
   - Configure LOIC according to `commands/loic_http_flood_config.md`, then run the HTTP Flood.
7. Observe the Wireshark I/O Graph to compare traffic against the baseline.
8. Apply the firewall rules described in `firewall/block_tcp_8000.md` and `firewall/block_udp_8000.md`, then repeat step 6 to verify the defensive measure.
9. Cross-reference the results with `docs/report-structure.md` and Chapters 5–6 of the `.docx` report.

## 5. Related Report

Full report: `30211456495_DangCongMinh_CS376_TechnologiesReport.docx` (submitted separately via Sakai).
