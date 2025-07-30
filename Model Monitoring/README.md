# Model Monitoring with Evidently

This folder contains results and notebooks for building a regression model to predict `TARGET_deathRate` from the **cancer\_reg.csv** dataset and setting up model monitoring using [Evidently](https://www.evidentlyai.com/).

> **Disclaimer**: I used AI tools such as ChatGPT for guidance during this assignment, but all implementation and final work is my own.

## Structure

```
.
├── evidently_monitoring.html          # Executed Jupyter notebook (HTML export)
├── evidently_monitoring.ipynb         # Code notebook for training and monitoring
├── evidently-dashboard-screenshot.png # Screenshot of Evidently Cloud dashboard
└── evidently-metrics-comparison.pdf   # Exported drift & metrics comparison report
```

## Summary of Work

### Model Development

* **Model:** RandomForestRegressor
* **Target Variable:** `TARGET_deathRate`
* **Features:** Selected numeric features, excluding `Geography` and `binnedInc`
* **Evaluation Metrics:** RMSE (root mean squared error) and R²

### Monitoring Scenarios

The model was evaluated on:

1. **Baseline Test Set** – Original, unmodified test data.
2. **Scenario A** – `medIncome` decreased by 40,000.
3. **Scenario A+B** – Scenario A plus `povertyPercent` increased by 20.
4. **Scenario A+B+C** – Scenario A+B plus `AvgHouseholdSize` increased by 2.

### Key Findings

* **Baseline:** RMSE **19.14**, R² **0.55** – solid baseline performance.
* **Scenario A (Income ↓40k):** RMSE increased to **21.58**, R² dropped to **0.43** – lowering income reduced model accuracy.
* **Scenario A+B (Income ↓, Poverty ↑):** RMSE rose further to **23.03**, R² dropped to **0.35** – compounding income and poverty changes worsened performance.
* **Scenario A+B+C (Income ↓, Poverty ↑, HH Size ↑):** RMSE slightly decreased to **22.53**, R² improved modestly to **0.38** – accuracy remained significantly degraded versus baseline.

Evidently dashboards flagged drift in modified features (`medIncome`, `povertyPercent`, `AvgHouseholdSize`) across scenarios, correlating with the observed performance degradation.

## Verdict

This assignment demonstrates how data drift and socioeconomic feature changes degrade model performance. Evidently provided clear, automated monitoring of feature drift and prediction metrics.