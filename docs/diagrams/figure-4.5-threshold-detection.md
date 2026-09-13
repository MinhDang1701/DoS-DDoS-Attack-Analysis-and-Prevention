# Figure 4.5. Illustration of Threshold-Based Detection: Baseline – Attack – After Applying the Firewall

```
 Traffic
 (pkt/s)
   │
20k┤                        ▄▄██▄▄
   │                      ▄███████▄
15k┤                    ▄███████████▄
   │                  ▄███████████████▄
10k┤ - - - - - - - - -█████████████████- - - - -  ← Threshold line
   │                ▄█████████████████████▄
 5k┤              ▄█████████████████████████▄
   │            ▄█████████████████████████████▄
   0┤▁▁▁▁▁▁▁▁▁▁▁███████████████████████████████▁▁▁▁▁▁▁▁▁▁▁▁▁
   └───────────┬───────────────────────────┬─────────────────▶ Time
           Baseline              Attack Period              After Firewall
          (near zero)          (exceeds threshold)          (returns to baseline)
```

This diagram illustrates the threshold-based detection principle described in Section 4.2.1 of the report. Traffic remains close to zero during the baseline period, rises sharply above the defined threshold during the attack, and returns to near-baseline levels once the corresponding Windows Firewall rule is applied — demonstrating the practical effect of the defensive measure on traffic volume.
