#!/bin/bash

if [ -z "$1" ] 
then
    echo "usage: $0 num"
    echo "   will create <num> instances named jacek1 .. jacek<num>"
    exit -1
fi

gcloud compute instances create --machine-type f1-micro --zone europe-west1-d --metadata-from-file startup-script=startup-script.sh `seq -f 'jacek%g' 1 $1`
