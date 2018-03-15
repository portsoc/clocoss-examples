#!/bin/bash

prefix="$1"

echo using prefix "\"$prefix\""

gcloud compute instances create "$prefix"www-lb-1 "$prefix"www-lb-2 \
    --zone us-central1-b \
    --tags "$prefix"http-lb-tag \
    --metadata startup-script="#! /bin/bash
      curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
      sudo apt-get install -y nodejs git
      sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
      sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
      git clone https://github.com/portsoc/clocoss-examples
      cd clocoss-examples/web-serve-machine-name
      npm i
      node server &"

gcloud compute instances create "$prefix"www-lb-3 "$prefix"www-lb-4 \
    --zone europe-west1-b \
    --tags "$prefix"http-lb-tag \
    --metadata startup-script="#! /bin/bash
      curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
      sudo apt-get install -y nodejs git
      sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
      sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443
      git clone https://github.com/portsoc/clocoss-examples
      cd clocoss-examples/web-serve-machine-name
      npm i
      node server &"
