#!/bin/bash

prefix="$1"

gcloud compute url-maps create "$prefix"web-map --default-service "$prefix"web-map-backend-service
gcloud compute target-http-proxies create "$prefix"http-lb-proxy --url-map "$prefix"web-map

ip=`gcloud compute addresses describe "$prefix"lb-ip --global | grep -E '^address:' | awk '{print $2}'`

gcloud compute forwarding-rules create "$prefix"http-cr-rule --address "$ip" --global --target-http-proxy "$prefix"http-lb-proxy --ports 80
