#!/bin/bash

prefix="$1"

gcloud compute addresses create "$prefix"lb-ip --ip-version=IPV4 --global
