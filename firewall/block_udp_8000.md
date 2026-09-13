# Windows Firewall Rule — Block Inbound UDP Port 8000

**Applied on:** Windows (Victim) — 192.168.100.20
**Purpose:** Block inbound UDP traffic directed to port 8000 (UDP Flood scenario).

## Rule Parameters

| Field | Value |
|---|---|
| Name | `DoS-Lab Block UDP 8000` |
| Direction | Inbound |
| Action | Block |
| Protocol | UDP |
| Local Port | 8000 |
| Profile | Domain / Private / Public |

## Creating the Rule via PowerShell

```powershell
New-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" `
  -Direction Inbound `
  -Protocol UDP `
  -LocalPort 8000 `
  -Action Block
```

## Important Note for Verification (matches report)

In this lab environment, **no actual UDP service is listening on port 8000** (only the Python HTTP Server on TCP). Therefore:
- The UDP rule is successfully configured and enabled (verified with `Get-NetFirewallRule` showing `Enabled: True`).
- No DROP logs are generated for UDP traffic because there is no UDP service to receive the packets.
- Consequently, the UDP defense section of the report describes **rule‑level validation only** (configuration verified, but no full traffic logs as with TCP).

## Verifying the Rule is Enabled

```powershell
Get-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" | Select DisplayName, Enabled, Direction, Action
```


**Áp dụng trên:** Windows (Victim) — 192.168.100.20
**Mục đích:** Chặn traffic UDP hướng tới cổng 8000 (kịch bản UDP Flood).

## Thông số rule

| Trường | Giá trị |
|---|---|
| Name | `DoS-Lab Block UDP 8000` |
| Direction | Inbound |
| Action | Block |
| Protocol | UDP |
| Local Port | 8000 |
| Profile | Domain / Private / Public |

## Tạo rule bằng PowerShell

```powershell
New-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" `
  -Direction Inbound `
  -Protocol UDP `
  -LocalPort 8000 `
  -Action Block
```

## Ghi chú giới hạn khi kiểm chứng (quan trọng — khớp với báo cáo)

Trong môi trường lab của đồ án này, **không có dịch vụ UDP nào thực sự lắng nghe trên cổng 8000** (chỉ có Python HTTP Server chạy TCP). Do đó:

- Rule UDP đã được **cấu hình và bật thành công** (xác nhận ở cấp độ rule — `Get-NetFirewallRule` hiển thị `Enabled: True`).
- **Không** thu được log DROP cụ thể cho traffic UDP, vì không có dịch vụ UDP để traffic "chạm" vào và bị ghi nhận là kết nối bị từ chối.
- Vì vậy, phần phòng thủ UDP trong báo cáo được trình bày là **"rule-level validation only"** (xác thực ở mức cấu hình, không có bằng chứng log đầy đủ như TCP).

## Kiểm tra rule đã bật

```powershell
Get-NetFirewallRule -DisplayName "DoS-Lab Block UDP 8000" | Select DisplayName, Enabled, Direction, Action
```
