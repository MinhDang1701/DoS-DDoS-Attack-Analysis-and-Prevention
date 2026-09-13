# Figure 4.7. DDoS-Detection Workflow Using Machine Learning (Future-Extension Direction)

```
┌────────────┐  ┌────────────────┐  ┌────────────────┐  ┌────────────────┐  ┌────────────────┐  ┌────────────────────┐
│  Collect      │─▶│  Preprocessing     │─▶│  Feature             │─▶│  Model               │─▶│  Model               │─▶│  Traffic                │
│  Network Data │  │                      │  │  Selection            │  │  Training             │  │  Evaluation           │  │  Classification          │
└────────────┘  └────────────────┘  └────────────────┘  └────────────────┘  └────────────────┘  └────────────────────┘
```

This diagram outlines a typical Machine Learning–based DDoS-detection workflow, as discussed in Section 4.4.1 of the report: collecting network traffic data, preprocessing it, selecting relevant features, training a classification model (e.g., Random Forest, SVM), evaluating its performance, and finally classifying traffic as normal or attack-related. This workflow is presented as a future-extension direction and was not implemented experimentally in this project.
