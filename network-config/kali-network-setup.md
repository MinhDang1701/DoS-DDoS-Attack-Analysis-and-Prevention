# Cấu hình mạng — Kali Linux (Attacker)

## Thông tin VM
- Hệ điều hành: Kali Linux
- Vai trò: Attacker (nguồn phát sinh traffic tấn công) + chạy Wireshark để bắt gói tin
- Nền tảng ảo hóa: Oracle VM VirtualBox

## Network Adapter
- Chế độ: **Internal Network**
- Tên mạng nội bộ: `intnet-lab`
- Lý do: cô lập toàn bộ traffic thử nghiệm khỏi mạng thật / Internet

## Địa chỉ IP tĩnh
| Thông số | Giá trị |
|---|---|
| IP Address | 192.168.100.10 |
| Subnet Mask | 255.255.255.0 (/24) |
| Gateway | (không cần thiết, mạng nội bộ cô lập) |

## Lệnh cấu hình IP tĩnh (ví dụ, tùy bản Kali/NetworkManager)

```bash
# Xem danh sách interface
ip a

# Gán IP tĩnh tạm thời cho interface (ví dụ eth1)
sudo ip addr add 192.168.100.10/24 dev eth1
sudo ip link set eth1 up
```

## Kiểm tra kết nối tới Windows victim

```bash
ping -c 4 192.168.100.20
```

Kết quả mong đợi: nhận được reply ổn định từ 192.168.100.20, xác nhận Internal Network hoạt động đúng trước khi tiến hành các kịch bản tấn công.
