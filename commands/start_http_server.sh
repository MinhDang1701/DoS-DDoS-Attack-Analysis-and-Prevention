#!/bin/bash
# ==============================================================
# Start the victim web server — CMU-CS 376 DoS/DDoS Lab
# RUN ON: Windows (Victim) — 192.168.100.20
#
# Note: this file documents the command to run on Windows using
# Python. On the actual Windows machine, run the command below in
# Command Prompt / PowerShell (bash is not required) after Python
# has been installed.
# ==============================================================

# Start Python's built-in HTTP server, listening on all interfaces,
# port 8000 (used as the target service for the HTTP Flood scenario
# and also as the port targeted by the SYN Flood / UDP Flood
# scenarios).
python -m http.server 8000

# After starting the server, verify from Kali Linux with:
#   curl http://192.168.100.20:8000
# or open the address in a browser to confirm the server is
# operating normally before running the attack scenarios.
