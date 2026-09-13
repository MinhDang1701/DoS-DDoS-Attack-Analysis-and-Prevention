# Report Structure — CMU-CS 376 Technologies Report

This document cross-references the structure of the `.docx` report with the files in this repository, to help reviewers verify content quickly.

**Project Title:** Denial of Service (DoS/DDoS) Attack Analysis and Prevention
**Student:** Dang Cong Minh — Student ID: 30211456495

## Report Table of Contents

- Statement of Originality
- Table of Contents / List of Figures / List of Tables / List of Abbreviations

**CHAPTER 1: INTRODUCTION**
1.1. Purpose of the Project
1.2. Objectives of the Project
1.3. Research Object and Scope
1.4. Research Methodology

**CHAPTER 2: RATIONALE FOR TECHNOLOGY SELECTION**
2.1. Technology Selection Criteria
2.2. Tech Stack → see `network-config/` and `commands/` in this repository
2.3. Rationale for the Virtualized Environment

**CHAPTER 3: WORK BREAKDOWN STRUCTURE AND IMPLEMENTATION SCHEDULE**
3.1. Individual Responsibility and Role
3.2. Work Breakdown Structure (WBS)
3.3. Implementation Schedule (Sep 13 – Sep 16)

**CHAPTER 4: OVERVIEW OF CORE TECHNOLOGIES**
4.1. Overview of DoS/DDoS Attacks (concepts, OSI/TCP-IP, C&C/Botnet, attack types)
4.2. Principles of DoS/DDoS Detection and Mitigation (threshold/signature/anomaly, IDS/IPS)
4.3. Related Standards (RFC 4987, RFC 4732, NIST SP 800-189, CISA)
4.4. Application of AI/ML to DDoS Detection and Mitigation (future-extension direction)

**CHAPTER 5: ARCHITECTURE DESIGN AND EXPERIMENTAL IMPLEMENTATION**
5.1. Experimental network topology → `README.md` (network diagram), `network-config/`
5.2. Implementation steps → `commands/`
5.3. Test scenarios and results → see Table 5.1, 5.2 in the report; corresponding commands in `commands/syn_flood.sh`, `commands/udp_flood.sh`, `commands/loic_http_flood_config.md`
5.4. Safety and ethical measures in the experiments

**CHAPTER 6: CONCLUSION AND FUTURE WORK**
6.1. Conclusion
6.2. Limitations of the project
6.3. Future work (AI-driven Defense, Zero Trust, IoT/edge devices, Cloud security)

**CHAPTER 7: REFERENCES**
- Standards and technical documents (RFC 4987, RFC 4732, NIST SP 800-189, CISA)
- Tool and software documentation (VirtualBox, Wireshark, Hping3, LOIC, Python http.server)
- Institutional documents (Vietnamese)

**APPENDICES**
- Appendix A. Test network configuration → corresponds to `network-config/kali-network-setup.md`, `network-config/windows-network-setup.md`
- Appendix B. Simulation commands (Hping3 and HTTP Flood) → corresponds to `commands/syn_flood.sh`, `commands/udp_flood.sh`, `commands/loic_http_flood_config.md`
- Appendix C. Windows Firewall rule used → corresponds to `firewall/block_tcp_8000.md`, `firewall/block_udp_8000.md`, `firewall/sample_pfirewall.log`

## Experimental Results Reference (Table 5.2 in the report)

| Scenario | Baseline | Peak During Attack | Defense Result |
|---|---|---|---|
| SYN Flood | ~0–2 pkt/s | ~12,500–14,000 pkt/s (~115s) | TCP rule verified — DROP SYN logged |
| UDP Flood | ~0–2 pkt/s | ~20,500 pkt/s (3s mark) | UDP rule configured & enabled (no DROP log, as no UDP service was present in the lab) |
| HTTP Flood | ~0–2 pkt/s | ~690 pkt/s, with `ConnectionAbortedError` | Connection timed out + DROP TCP logged |
