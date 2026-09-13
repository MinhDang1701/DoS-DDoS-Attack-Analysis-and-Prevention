# Figure 4.1. Comparison of the DoS Model (Single Source) and the DDoS Model (Multiple Distributed Sources)

```
 (a) DoS — Single Source                (b) DDoS — Distributed Sources

 ┌──────────┐                            ┌──────────────┐
 │ Attacker    │                            │  C&C Server      │
 └────┬─────┘                            └───────┬──────┘
      │                                                 │
      ▼                                                 ▼
 ┌──────────┐                    ┌────────┬────────┬────────┐
 │  Target     │                    │  Bot 1   │  Bot 2   │  Bot N   │
 └──────────┘                    └────┬───┴────┬───┴────┬───┘
                                                │             │             │
                                                └─────────────┼─────────────┘
                                                                             ▼
                                                                     ┌──────────┐
                                                                     │  Target     │
                                                                     └──────────┘
```

This diagram contrasts the two attack models discussed in the report. In the DoS model, a single attacking host directly generates traffic toward the target — the model implemented experimentally in this project. In the DDoS model, a Command-and-Control (C&C) server coordinates a distributed botnet of compromised devices, all of which simultaneously direct traffic at the target, making the attack larger in scale and harder to trace. Only the DoS model was implemented experimentally; the DDoS model is presented here at the theoretical level.
