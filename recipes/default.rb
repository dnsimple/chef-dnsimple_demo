dnsimple_record 'chef_dnsimple_demo' do
  name node['dnsimple']['demo_id']
  domain 'dnsimple.sexy'
  type 'A'
  content node['ipaddress']
  ttl 60
  access_token node['dnsimple']['access_token']
  action [:create, :update]
end

httpd_service 'default' do
  action [:create, :start]
end

httpd_config 'default' do
  source 'test.erb'
  notifies :restart, 'httpd_service[default]'
  action :create
end

file '/var/www/index.html' do
  content "<html><body><h1>Domain Management Automated with Chef&trade;</h1></ br><h2>Welcome to our webinar #{node['dnsimple']['demo_id'].capitalize}</h2></body></html>"
  owner 'www-data'
  group 'www-data'
  mode '644'
end
