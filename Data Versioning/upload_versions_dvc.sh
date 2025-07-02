#!/bin/bash

source venv/bin/activate
pip install "dvc[s3]"

# Load AWS credentials from .env
set -o allexport
source "Data Versioning/.env"
set +o allexport

# Initialize DVC
dvc init
git add .
git commit -m "Init DVC in mlops-summer-2025 repo"

# Add S3 remote for DVC (separate from LakeFS)
dvc remote add -d dvcstore s3://mlops-data-soham-mandal/dvc-store
dvc remote modify dvcstore endpointurl https://s3.amazonaws.com
git add .dvc/config
git commit -m "Add S3 remote for DVC (dvc-store)"

# Add CSVs to DVC tracking
dvc add "Data Versioning/v1_train.csv"
dvc add "Data Versioning/v1_test.csv"
dvc add "Data Versioning/v2_train.csv"
dvc add "Data Versioning/v2_test.csv"

# Commit .dvc files
git add "Data Versioning"/*.dvc .gitignore
git commit -m "Track v1 & v2 train/test CSVs with DVC"

# Push data to S3
dvc push

# Optional: Verify S3 contents
dvc list s3://mlops-data-soham-mandal/dvc-store/
