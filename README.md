# DoS/DDoS Attack Analysis and Prevention — Lab Source & Config

**Môn học:** CMU-CS 376 – Elements of Network Security
**Trường:** Duy Tan University – CMU Joint-Training Program
**Sinh viên:** Đặng Công Minh — MSSV: 30211456495
**Đề tài:** Denial of Service (DoS/DDoS) Attack Analysis and Prevention

> ⚠️ **CẢNH BÁO / DISCLAIMER**
> Toàn bộ nội dung trong repo này (lệnh tấn công, cấu hình) **chỉ được thực hiện trong môi trường phòng lab ảo hóa cô lập (VirtualBox Internal Network)**, phục vụ mục đích học tập và nghiên cứu học thuật. **Tuyệt đối không** sử dụng các lệnh/kỹ thuật này nhắm vào bất kỳ hệ thống, mạng, hoặc dịch vụ nào mà bạn không sở hữu hoặc không có sự cho phép rõ ràng. Việc thực hiện tấn công DoS/DDoS vào hệ thống của bên thứ ba là hành vi vi phạm pháp luật.

---

## 1. Mục đích repo

Repo này đi kèm báo cáo kỹ thuật `30211456495_DangCongMinh_CS376_TechnologiesReport.docx`, cung cấp:

- Các lệnh mô phỏng tấn công (SYN Flood, UDP Flood, HTTP Flood) đã sử dụng trong thực nghiệm.
- Cấu hình mạng ảo hóa (IP, Internal Network).
- Cấu hình rule Windows Firewall dùng để phòng thủ và log minh chứng.
- Cấu trúc báo cáo để đối chiếu nhanh với các chương/mục.

## 2. Sơ đồ mạng thực nghiệm

```
        VirtualBox Internal Network ("intnet-lab")
        (cô lập hoàn toàn với mạng ngoài / Internet)

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

## 3. Cấu trúc thư mục

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
    └── report-structure.md
```

## 4. Hướng dẫn tái lập 3 kịch bản (trong môi trường lab của bạn)

1. Dựng 2 VM VirtualBox, gắn network adapter cả hai ở chế độ **Internal Network** cùng tên (`intnet-lab`).
2. Cấu hình IP tĩnh theo `network-config/`.
3. Kiểm tra kết nối bằng `ping` hai chiều.
4. Trên Windows: chạy `commands/start_http_server.sh` (thực chất là lệnh Python, xem nội dung file) để mở web server cổng 8000.
5. Trên Kali: mở Wireshark, bắt đầu capture trên interface nội bộ.
6. Lần lượt chạy:
   - `commands/syn_flood.sh`
   - `commands/udp_flood.sh`
   - Cấu hình LOIC theo `commands/loic_http_flood_config.md` rồi chạy HTTP Flood.
7. Quan sát I/O Graph trong Wireshark để so sánh với baseline.
8. Áp rule Firewall theo `firewall/block_tcp_8000.md` và `firewall/block_udp_8000.md`, sau đó lặp lại bước 6 để kiểm chứng khả năng phòng thủ.
9. Đối chiếu kết quả với `docs/report-structure.md` và các Chương 5, 6 trong báo cáo `.docx`.

## 5. Liên kết báo cáo

Báo cáo đầy đủ: `30211456495_DangCongMinh_CS376_TechnologiesReport.docx` (nộp riêng trên Sakai).
