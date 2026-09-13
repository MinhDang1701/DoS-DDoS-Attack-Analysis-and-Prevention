# Figure 4.3. The Command and Control (C&C) and Botnet Mechanism

```
 ┌──────────┐   command channel    ┌──────────────┐
 │ Attacker    │ ────────────────────▶ │  C&C Server      │
 └──────────┘                        └───────┬──────┘
                                                     │ commands
                          ┌──────────────────┼──────────────────┐
                          ▼                      ▼                      ▼
                    ┌──────────┐         ┌──────────┐         ┌──────────┐
                    │  Bot 1     │         │  Bot 2     │         │  Bot N     │
                    └────┬─────┘         └────┬─────┘         └────┬─────┘
                             │  attack traffic       │  attack traffic       │  attack traffic
                             └──────────────────────┼──────────────────────┘
                                                                             ▼
                                                                     ┌──────────┐
                                                                     │  Target     │
                                                                     └──────────┘
```

This diagram illustrates the general Command-and-Control (C&C) and botnet mechanism used in real-world DDoS attacks. The attacker issues commands to a C&C server, which in turn directs a distributed set of compromised bot devices to simultaneously generate attack traffic toward the target. This mechanism is presented at the theoretical level only; it was not implemented in the experimental portion of this project, which uses a single attacking machine instead.
