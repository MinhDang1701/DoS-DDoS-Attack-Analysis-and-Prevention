# Figure 4.2. Position of DoS/DDoS Attack Types Within the OSI / TCP-IP Model

```
┌───────────────────────────┬─────────────────────────────────┐
│  OSI / TCP-IP Layer          │  Associated DoS/DDoS Attack Type    │
├───────────────────────────┼─────────────────────────────────┤
│  Application                  │  HTTP Flood, Slowloris                │
├───────────────────────────┼─────────────────────────────────┤
│  Transport (TCP/UDP)          │  SYN Flood, UDP Flood                  │
├───────────────────────────┼─────────────────────────────────┤
│  Network (IP/ICMP)             │  ICMP Flood, Amplification/Reflection │
├───────────────────────────┼─────────────────────────────────┤
│  Data Link / Physical          │  Volumetric / bandwidth-exhaustion     │
│                                  │  attacks (multiple layers)             │
└───────────────────────────┴─────────────────────────────────┘
```

This diagram maps each attack type discussed in Section 4.1.3 of the report to the network layer it primarily exploits. Attacks at lower layers (network/transport) typically focus on exhausting connection or bandwidth resources, while application-layer attacks such as HTTP Flood consume server-side processing resources by mimicking legitimate request patterns.
