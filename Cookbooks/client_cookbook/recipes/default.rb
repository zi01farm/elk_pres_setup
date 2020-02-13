#
# Cookbook:: client_cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

script 'filebeat install' do
  interpreter "bash"
  code <<-EOH
  echo "deb https://packages.elastic.co/beats/apt stable main" | sudo tee -a /etc/apt/sources.list.d/beats.list
  sudo apt-get update
  sudo apt-get install filebeat -y --allow-unauthenticated
  EOH
end

execute 'start filebeat' do
  command '/etc/init.d/filebeat start'
end

template '/etc/filebeat/filebeat.yml' do
  source 'filebeat.yml.erb'
end


