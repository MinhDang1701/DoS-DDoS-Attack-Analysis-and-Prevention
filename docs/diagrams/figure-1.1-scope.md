# Figure 1.1. Scope of the Experimental System (Isolated VirtualBox Internal Network Environment)

```
 ┌───────────────────────────────────────────────────────────┐
 │                Isolated Virtual Lab (In Scope)               │
 │        VirtualBox Internal Network — "intnet-lab"             │
 │                                                                │
 │   ┌───────────────────┐         ┌───────────────────┐        │
 │   │   Kali Linux        │  <──>   │   Windows            │        │
 │   │   (Attacker)         │         │   (Victim)            │        │
 │   │   192.168.100.10     │         │   192.168.100.20      │        │
 │   └───────────────────┘         └───────────────────┘        │
 │                                                                │
 └───────────────────────────────────────────────────────────┘
                              ╳
                    NO connection to external network
                              ╳
              ┌─────────────────────────────────┐
              │   Real Internet / External Network │
              │        (out of project scope)         │
              └─────────────────────────────────┘
```

This diagram illustrates the boundary of the experimental system used in this project. All attack simulation, traffic capture, and defense testing take place strictly within the isolated VirtualBox Internal Network, with no routing path to the real Internet or any external network. This isolation ensures that experimental traffic cannot affect systems outside the defined research scope.
