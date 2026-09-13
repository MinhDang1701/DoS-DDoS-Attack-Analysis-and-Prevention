# Figure 4.6. Comparison of the IDS (Alert) and IPS (Response/Block) Processing Flows

```
 IDS (Intrusion Detection System)

 ┌─────────┐   ┌────────────┐   ┌────────────┐   ┌─────────┐
 │  Traffic   │──▶│  Analysis      │──▶│  Detection      │──▶│  Alert      │
 └─────────┘   └────────────┘   └────────────┘   └─────────┘

 IPS (Intrusion Prevention System)

 ┌─────────┐   ┌────────────┐   ┌────────────┐   ┌───────────────────┐
 │  Traffic   │──▶│  Analysis      │──▶│  Detection      │──▶│  Response / Block      │
 └─────────┘   └────────────┘   └────────────┘   └───────────────────┘
```

This diagram contrasts the processing flow of an Intrusion Detection System (IDS), which analyzes traffic and issues alerts without directly acting on it, with that of an Intrusion Prevention System (IPS), which extends detection with the ability to actively block or drop malicious traffic. In this project, Wireshark serves purely as a traffic-analysis tool, while Windows Firewall performs the response/block function — together resembling an IPS-like workflow without constituting a dedicated IDS/IPS system.
