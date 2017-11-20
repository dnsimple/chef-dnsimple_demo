#!/usr/bin/env bash

## Expects the following vars to be exported
# DIGITALOCEAN_ACCESS_TOKEN
# DIGITALOCEAN_SSH_KEY_IDS
# DNSIMPLE_ACCESS_TOKEN
# DNSIMPLE_DEMO_ID

curl --silent -X GET -H 'Content-Type: application/json' -H "Authorization: Bearer $DIGITALOCEAN_ACCESS_TOKEN" "https://api.digitalocean.com/v2/account/keys" | python -m json.tool
