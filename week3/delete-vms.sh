#!/bin/bash

if [ -z "$1" ] 
then
    echo "usage: $0 num"
    echo "   will delete <num> instances named jacek1 .. jacek<num>"
    exit -1
fi

gcloud compute instances delete --quiet --zone europe-west1-d `seq -f 'jacek%g' 1 $1`
