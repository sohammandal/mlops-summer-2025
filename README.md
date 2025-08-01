# MLOps Summer 2025

Course repo for UChicago's MLOps course in Summer 2025.

## Contents

- `FastAPI/`: Assignment 0 – API for ML model serving
- `Data Versioning/`: Assignment 1 – LakeFS, DVC, and DP modeling
- `ML Experiments & Feature Store/`: Assignment 2 - ML Experiments with Feature Store and Pipeline
- `AutoML/`: Assignment 3: AutoML with FLAML and H2O
- `Model Monitoring/`: Assignment 4: Model Monitoring with Evidently

## Setup

1. Clone the repo:
```bash
git clone git@github.com:sohammandal/mlops-summer-2025.git
cd mlops-summer-2025
````

2. Install [`uv`](https://github.com/astral-sh/uv) (if not already installed):

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

3. Install dependencies and setup the environment:

```bash
uv sync
source .venv/bin/activate
```