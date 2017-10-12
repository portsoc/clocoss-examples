#!/bin/bash

if [ -z "$1" ] 
then
    echo "usage: $0 num"
    echo "   will create <num> instances"
    exit -1
fi

gcloud compute instances create --instance-type f1.micro `seq -f 'jacek%g' 1 $1`
