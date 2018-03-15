#!/bin/bash

prefix="$1"

gcloud compute firewall-rules create "$prefix"www-lb-firewall --target-tags http-lb-tag --allow tcp:80
