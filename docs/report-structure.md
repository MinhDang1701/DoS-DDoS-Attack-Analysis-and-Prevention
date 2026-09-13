# Cấu trúc báo cáo — CMU-CS 376 Technologies Report

Tài liệu này đối chiếu nhanh giữa cấu trúc báo cáo `.docx` và các file trong repo, giúp người chấm dễ dàng kiểm tra.

**Đề tài:** Denial of Service (DoS/DDoS) Attack Analysis and Prevention
**Sinh viên:** Đặng Công Minh — MSSV: 30211456495

## Mục lục báo cáo

- Statement of Originality
- Table of Contents / List of Figures / List of Tables / List of Abbreviations

**CHƯƠNG 1: INTRODUCTION**
1.1. Purpose of the Project
1.2. Objectives of the Project
1.3. Research Object and Scope
1.4. Research Methodology

**CHƯƠNG 2: RATIONALE FOR TECHNOLOGY SELECTION**
2.1. Technology Selection Criteria
2.2. Tech Stack → xem `network-config/` và `commands/` trong repo này
2.3. Rationale for the Virtualized Environment

**CHƯƠNG 3: WORK BREAKDOWN STRUCTURE AND IMPLEMENTATION SCHEDULE**
3.1. Individual Responsibility and Role
3.2. Work Breakdown Structure (WBS)
3.3. Implementation Schedule (Sep 13 – Sep 16)

**CHƯƠNG 4: OVERVIEW OF CORE TECHNOLOGIES**
4.1. Overview of DoS/DDoS Attacks (khái niệm, OSI/TCP-IP, C&C/Botnet, các loại tấn công)
4.2. Principles of DoS/DDoS Detection and Mitigation (threshold/signature/anomaly, IDS/IPS)
4.3. Related Standards (RFC 4987, RFC 4732, NIST SP 800-189, CISA)
4.4. Application of AI/ML to DDoS Detection and Mitigation (định hướng tương lai)

**CHƯƠNG 5: ARCHITECTURE DESIGN AND EXPERIMENTAL IMPLEMENTATION**
5.1. Experimental network topology → `README.md` (sơ đồ mạng), `network-config/`
5.2. Implementation steps → `commands/`
5.3. Test scenarios and results → xem Table 5.1, 5.2 trong báo cáo; lệnh tương ứng tại `commands/syn_flood.sh`, `commands/udp_flood.sh`, `commands/loic_http_flood_config.md`
5.4. Safety and ethical measures in the experiments

**CHƯƠNG 6: CONCLUSION AND FUTURE WORK**
6.1. Conclusion
6.2. Limitations of the project
6.3. Future work (AI-driven Defense, Zero Trust, IoT/edge, Cloud security)

**CHƯƠNG 7: REFERENCES**
- Standards and technical documents (RFC 4987, RFC 4732, NIST SP 800-189, CISA)
- Tool and software documentation (VirtualBox, Wireshark, Hping3, LOIC, Python http.server)
- Institutional documents (Vietnamese)

**APPENDICES**
- Appendix A. Test network configuration → tương ứng `network-config/kali-network-setup.md`, `network-config/windows-network-setup.md`
- Appendix B. Simulation commands (Hping3 and HTTP Flood) → tương ứng `commands/syn_flood.sh`, `commands/udp_flood.sh`, `commands/loic_http_flood_config.md`
- Appendix C. Windows Firewall rule used → tương ứng `firewall/block_tcp_8000.md`, `firewall/block_udp_8000.md`, `firewall/sample_pfirewall.log`

## Ghi chú đối chiếu số liệu thực nghiệm (Table 5.2 trong báo cáo)

| Scenario | Baseline | Peak khi tấn công | Kết quả phòng thủ |
|---|---|---|---|
| SYN Flood | ~0–2 pkt/s | ~12,500–14,000 pkt/s (~115s) | TCP rule verified — DROP SYN logged |
| UDP Flood | ~0–2 pkt/s | ~20,500 pkt/s (mốc 3s) | UDP rule configured & enabled (không có DROP log do lab không có service UDP) |
| HTTP Flood | ~0–2 pkt/s | ~690 pkt/s, kèm `ConnectionAbortedError` | Connection timed out + DROP TCP logged |
