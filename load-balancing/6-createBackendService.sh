#!/bin/bash

prefix="$1"

gcloud compute backend-services create "$prefix"web-map-backend-service --protocol HTTP --health-checks "$prefix"http-basic-check --global

gcloud compute backend-services add-backend "$prefix"web-map-backend-service \
    --balancing-mode UTILIZATION \
    --max-utilization 0.8 \
    --capacity-scaler 1 \
    --instance-group "$prefix"lb-us-group \
    --instance-group-zone us-central1-b \
    --global

gcloud compute backend-services add-backend "$prefix"web-map-backend-service \
    --balancing-mode UTILIZATION \
    --max-utilization 0.8 \
    --capacity-scaler 1 \
    --instance-group "$prefix"lb-eu-group \
    --instance-group-zone europe-west1-b \
    --global
