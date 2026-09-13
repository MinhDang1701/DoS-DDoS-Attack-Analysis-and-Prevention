# LOIC Configuration — HTTP Flood Scenario

**Tool:** LOIC (Low Orbit Ion Cannon)
**Run on:** Kali Linux (Attacker) — 192.168.100.10
**Target:** Windows (Victim) — 192.168.100.20, port 8000 (Python HTTP Server)

## Configuration Parameters Used in the Experiment

| Field | Value |
|---|---|
| Target IP / URL | `192.168.100.20` |
| Port | `8000` |
| Method | HTTP — continuous `GET` requests |
| Threads | Set according to available machine resources (a level sufficient to produce observable load, consistent with the hardware constraints of an individual lab environment) |
| Attack mode | Continuous flood (unlimited number of requests) |

## Procedure

1. Before running LOIC, confirm the Python HTTP Server on Windows is operating normally:
   ```bash
   curl -I http://192.168.100.20:8000
   ```
2. Open LOIC on Kali Linux and enter the Target IP and Port as listed above.
3. Start the Wireshark capture on Kali before initiating the attack in LOIC (the "IMMA CHARGIN MAH LAZER" button in the original LOIC interface).
4. Observe:
   - Increasing TCP traffic in the Wireshark I/O Graph.
   - The console/log output of the Python HTTP Server on Windows (watch for abnormal errors, e.g., `ConnectionAbortedError`).
5. Stop LOIC, stop the capture, and save the resulting `.pcapng` file for analysis.

## Safety Note

Only point LOIC at `192.168.100.20` (the victim machine within the isolated Internal Network). **Never** configure LOIC to target any public domain or IP address.
