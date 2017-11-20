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

kitchen destroy

chef gem install dnsimple
ruby delete_record.rb

my_url=http://$DNSIMPLE_DEMO_ID.dnsimple.sexy

echo "The domain $my_url is deleted."
