# AutoML Comparison: FLAML vs H2O

This folder contains results and notebooks comparing two full-code AutoML platforms — FLAML and H2O — on the same athletes dataset with the target variable `deadlift`.

> **Disclaimer**: I used AI tools such as ChatGPT for guidance during this assignment, but all implementation and final work is my own.

## Structure

```

.
├── flaml\_all.log          # FLAML logs (all features)
├── flaml\_top3.log         # FLAML logs (top 3 features)
├── FLAML.html             # Executed FLAML notebook (HTML export)
├── FLAML.ipynb            # FLAML code notebook
├── H2O.html               # Executed H2O notebook (HTML export)
└── H2O.ipynb              # H2O code notebook

```

## Summary of Results

### FLAML

- **Platform:** Full-code
- **Best Estimators:**
  - All features: `extra_tree` — RMSE: 18,411.17
  - Top 3 features: `rf` — RMSE: 8,234.08
- **Fastest Models:** `lgbm`, `xgboost`, `extra_tree`
- **Conclusion:** Outperformed all previous assignment models with lower RMSE and faster training.

### H2O AutoML

- **Platform:** Full-code
- **Best Models:**
  - All features: `StackedEnsemble_AllModels_1` — RMSE: 69,853.84
  - Top 3 features: `StackedEnsemble_AllModels_3` — RMSE: 401,498.87
- **Fastest Models:** `GBM_1`, `XGBoost_1`, `DRF_1`
- **Conclusion:** Ensemble models dominated but performed worse than FLAML. Performance degraded significantly when using only top 3 features.

## Verdict

FLAML provided superior performance in both accuracy and speed across all configurations. H2O showed model diversity but underperformed on this specific regression task.