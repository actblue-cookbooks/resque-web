include_recipe 'redis-ats'

gem_package 'resque'

template '/etc/init/resque-web.conf' do
  owner 'root'
  group 'root'
  mode '0644'
end

service 'resque-web' do
  provider Chef::Provider::Service::Upstart
  supports :restart => true
  action [:enable, :start]
end
