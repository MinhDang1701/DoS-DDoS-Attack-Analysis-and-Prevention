#!/bin/bash
# ===========================================================================
# Launch the victim web server — CMU-CS 376 DoS/DDoS Lab
# RUNNING ON: Windows (Victim) — 192.168.100.20
#
# NOTE: This file documents the command to be executed on Windows using Python.
# On Windows, run the following command in Command Prompt or PowerShell (no Bash needed) after Python has been installed.
# ===========================================================================

# Launch the built‑in Python HTTP server, listening on all interfaces, port 8000.
# This service is the target for the HTTP Flood as well as the SYN/UDP Flood attacks.
python -m http.server 8000

# After starting the server, verify from Kali Linux:
#   curl http://192.168.100.20:8000
# or open a browser pointing to the above address to confirm the server is operating normally before proceeding with the attack scenarios.
