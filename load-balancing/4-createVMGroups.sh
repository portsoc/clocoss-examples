#!/bin/bash

prefix="$1"

gcloud compute instance-groups unmanaged create "$prefix"lb-us-group --zone us-central1-b 
gcloud compute instance-groups unmanaged create "$prefix"lb-eu-group --zone europe-west1-b

gcloud compute instance-groups unmanaged add-instances "$prefix"lb-us-group --instances "$prefix"www-lb-1,"$prefix"www-lb-2 --zone us-central1-b
gcloud compute instance-groups unmanaged add-instances "$prefix"lb-eu-group --instances "$prefix"www-lb-3,"$prefix"www-lb-4 --zone europe-west1-b

gcloud compute instance-groups unmanaged set-named-ports "$prefix"lb-us-group --named-ports http:80 --zone us-central1-b
gcloud compute instance-groups unmanaged set-named-ports "$prefix"lb-eu-group --named-ports http:80 --zone europe-west1-b
