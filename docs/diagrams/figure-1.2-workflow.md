# Figure 1.2. Experimental and Availability-Evaluation Workflow

```
┌───────────────┐   ┌───────────────────┐   ┌────────────────────┐
│  Set Up Lab      │──▶│  Capture Baseline     │──▶│  Execute Attack        │
│  Environment      │   │  Traffic               │   │  Scenario               │
└───────────────┘   └───────────────────┘   └────────────────────┘
                                                              │
                                                              ▼
┌───────────────┐   ┌───────────────────┐   ┌────────────────────┐
│  Compare Results  │◀──│  Apply Firewall Rule  │◀──│  Capture Traffic       │
│  & Evaluate         │   │  & Re-test              │   │  (Wireshark)            │
│  Availability       │   │                         │   │                          │
└───────────────┘   └───────────────────┘   └────────────────────┘
```

This workflow describes the sequential process followed for each attack scenario in the project: establishing the lab environment, recording a traffic baseline, executing the attack, capturing and analyzing traffic with Wireshark, applying the corresponding firewall rule, re-testing under the defended condition, and finally comparing the results to evaluate the impact on system Availability — the CIA-triad property most directly affected by DoS/DDoS attacks.
