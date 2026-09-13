# Cấu hình LOIC — Kịch bản HTTP Flood

**Công cụ:** LOIC (Low Orbit Ion Cannon)
**Chạy trên:** Kali Linux (Attacker) — 192.168.100.10
**Mục tiêu:** Windows (Victim) — 192.168.100.20, cổng 8000 (Python HTTP Server)

## Thông số cấu hình đã sử dụng trong thực nghiệm

| Trường | Giá trị |
|---|---|
| Target IP / URL | `192.168.100.20` |
| Port | `8000` |
| Method | HTTP — gửi liên tục các request `GET` |
| Threads | Tùy cấu hình máy (thiết lập ở mức đủ tạo tải quan sát được, phù hợp giới hạn phần cứng của môi trường lab cá nhân) |
| Attack mode | Continuous flood (không giới hạn số lượng request) |

## Quy trình thực hiện

1. Trước khi chạy LOIC, xác nhận Python HTTP Server trên Windows đang hoạt động:
   ```bash
   curl -I http://192.168.100.20:8000
   ```
2. Mở LOIC trên Kali Linux, nhập Target IP và Port như bảng trên.
3. Bắt đầu Wireshark capture trên Kali trước khi bấm nút bắt đầu tấn công trong LOIC (nút "IMMA CHARGIN MAH LAZER" trong giao diện gốc của LOIC).
4. Quan sát:
   - Lưu lượng TCP tăng trên Wireshark I/O Graph.
   - Log/console của Python HTTP Server trên Windows (theo dõi lỗi bất thường, ví dụ `ConnectionAbortedError`).
5. Dừng LOIC, dừng capture, lưu lại file `.pcapng` để phân tích.

## Ghi chú an toàn

Chỉ trỏ LOIC vào địa chỉ `192.168.100.20` (máy victim nằm trong Internal Network cô lập). **Không** cấu hình LOIC trỏ tới bất kỳ domain/IP công cộng nào.
