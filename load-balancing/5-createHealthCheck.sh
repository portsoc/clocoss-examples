#!/bin/bash

prefix="$1"

gcloud compute health-checks create http "$prefix"http-basic-check

