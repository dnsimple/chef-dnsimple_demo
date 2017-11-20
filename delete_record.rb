#!/usr/bin/env ruby

require 'dnsimple'

client = Dnsimple::Client.new(access_token: ENV['DNSIMPLE_ACCESS_TOKEN'])
account_id = client.identity.whoami.data.account.id
record_id = client.zones.records(account_id, 'dnsimple.sexy', filter: { type: 'A', name: ENV['DNSIMPLE_DEMO_ID'] }).data.first.id
client.zones.delete_record(account_id, 'dnsimple.sexy', record_id)
