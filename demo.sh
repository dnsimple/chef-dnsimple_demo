#!/usr/bin/env bash

## Expects the following vars to be exported
# DIGITALOCEAN_ACCESS_TOKEN
# DIGITALOCEAN_SSH_KEY_IDS
# DNSIMPLE_ACCESS_TOKEN
# DNSIMPLE_DEMO_ID

if [[ $1 != "" ]]; then
  DNSIMPLE_DEMO_ID=$1
fi

eval "$(chef shell-init bash)"

kitchen converge

my_url=http://$DNSIMPLE_DEMO_ID.dnsimple.sexy

echo "Check out $my_url"

##
# Stupid negitive cache
# open "$my_url"
