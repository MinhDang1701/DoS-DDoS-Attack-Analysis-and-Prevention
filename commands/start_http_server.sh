#!/bin/bash
# ==============================================================
# Khởi động web server nạn nhân — CMU-CS 376 DoS/DDoS Lab
# CHẠY TRÊN: Windows (Victim) — 192.168.100.20
#
# Ghi chú: file này mô tả lệnh chạy trên Windows bằng Python.
# Trên Windows thực tế, chạy lệnh dưới đây trong Command Prompt /
# PowerShell (không cần bash) sau khi đã cài Python.
# ==============================================================

# Khởi động Python built-in HTTP server, lắng nghe trên tất cả
# interface, cổng 8000 (dùng làm dịch vụ mục tiêu cho HTTP Flood
# và cũng là cổng bị nhắm tới trong SYN Flood / UDP Flood).
python -m http.server 8000

# Sau khi chạy, kiểm tra từ Kali Linux:
#   curl http://192.168.100.20:8000
# hoặc mở trình duyệt trỏ tới địa chỉ trên để xác nhận server
# hoạt động bình thường trước khi tiến hành các kịch bản tấn công.
