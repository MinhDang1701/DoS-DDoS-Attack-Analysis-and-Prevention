# Cấu hình mạng — Windows (Victim)

## Thông tin VM
- Hệ điều hành: Windows
- Vai trò: Victim — chạy Python HTTP Server (cổng 8000) + Windows Firewall (biện pháp phòng thủ)
- Nền tảng ảo hóa: Oracle VM VirtualBox

## Network Adapter
- Chế độ: **Internal Network**
- Tên mạng nội bộ: `intnet-lab` (phải trùng với Kali Linux)

## Địa chỉ IP tĩnh
| Thông số | Giá trị |
|---|---|
| IP Address | 192.168.100.20 |
| Subnet Mask | 255.255.255.0 (/24) |
| Gateway | (không cần thiết, mạng nội bộ cô lập) |

## Cấu hình IP tĩnh (Windows)

1. Control Panel → Network and Sharing Center → Change adapter settings
2. Chuột phải interface Internal Network → Properties → Internet Protocol Version 4 (TCP/IPv4) → Properties
3. Nhập:
   - IP address: `192.168.100.20`
   - Subnet mask: `255.255.255.0`
4. OK để áp dụng.

Hoặc dùng PowerShell (Run as Administrator):

```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.100.20 -PrefixLength 24
```

## Kiểm tra kết nối tới Kali attacker

```powershell
ping 192.168.100.10
```

## Xác nhận cổng dịch vụ

Sau khi khởi động Python HTTP Server (xem `commands/start_http_server.sh`), kiểm tra cổng 8000 đang lắng nghe:

```powershell
netstat -ano | findstr :8000
```
