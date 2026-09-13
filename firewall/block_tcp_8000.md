# Windows Firewall Rule — Block Inbound TCP Port 8000

**Áp dụng trên:** Windows (Victim) — 192.168.100.20
**Mục đích:** Chặn traffic TCP (bao gồm SYN Flood và HTTP Flood) hướng tới dịch vụ Python HTTP Server trên cổng 8000.

## Thông số rule

| Trường | Giá trị |
|---|---|
| Name | `DoS-Lab Block HTTP 8000` |
| Direction | Inbound |
| Action | Block |
| Protocol | TCP |
| Local Port | 8000 |
| Remote Address | 192.168.100.10 (Kali attacker) |
| Profile | Domain / Private / Public (tùy cấu hình máy ảo) |
| Logging | Bật ghi log gói tin bị drop (pfirewall.log) |

## Tạo rule bằng GUI (Windows Defender Firewall with Advanced Security)

1. Mở **Windows Defender Firewall with Advanced Security**.
2. Chọn **Inbound Rules** → **New Rule…**
3. Rule Type: **Port**
4. Protocol: **TCP**, Specific local ports: `8000`
5. Action: **Block the connection**
6. Profile: chọn tất cả (Domain, Private, Public)
7. Name: `DoS-Lab Block HTTP 8000`

## Tạo rule bằng PowerShell (tương đương)

```powershell
New-NetFirewallRule -DisplayName "DoS-Lab Block HTTP 8000" `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 8000 `
  -RemoteAddress 192.168.100.10 `
  -Action Block
```

## Bật logging cho gói tin bị drop

```powershell
Set-NetFirewallProfile -LogBlocked True -LogFileName "%SystemRoot%\System32\LogFiles\Firewall\pfirewall.log"
```

## Kiểm chứng (Verification)

Trên Kali, sau khi bật rule:

```bash
curl http://192.168.100.20:8000
# Kết quả mong đợi: "Connection timed out"
```

Trên Windows, kiểm tra log:

```powershell
Get-Content "$env:SystemRoot\System32\LogFiles\Firewall\pfirewall.log" -Tail 20
```

Kết quả mong đợi: xuất hiện các dòng `DROP` cho traffic TCP (bao gồm gói TCP SYN) từ `192.168.100.10` tới `192.168.100.20:8000` — xác nhận rule hoạt động hiệu quả với cả kịch bản HTTP Flood và SYN Flood.
