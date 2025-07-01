#!/bin/bash

REPO="mlops-athletes"

V1_TRAIN="Data Versioning/v1_train.csv"
V1_TEST="Data Versioning/v1_test.csv"
V2_TRAIN="Data Versioning/v2_train.csv"
V2_TEST="Data Versioning/v2_test.csv"

# V1
lakectl branch create lakefs://${REPO}/v1 --source lakefs://${REPO}/main

lakectl fs upload lakefs://${REPO}/v1/v1_train.csv -s "$V1_TRAIN"
lakectl fs upload lakefs://${REPO}/v1/v1_test.csv -s "$V1_TEST"

lakectl commit lakefs://${REPO}/v1 -m "Initial cleaned and split v1 dataset"

# V2
lakectl branch create lakefs://${REPO}/v2 --source lakefs://${REPO}/v1

lakectl fs upload lakefs://${REPO}/v2/v2_train.csv -s "$V2_TRAIN"
lakectl fs upload lakefs://${REPO}/v2/v2_test.csv -s "$V2_TEST"

lakectl commit lakefs://${REPO}/v2 -m "Cleaned, feature-engineered and split v2 dataset"