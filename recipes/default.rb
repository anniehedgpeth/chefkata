#
# Cookbook:: chefkata
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'nano' do
  action :install
end

directory '/var/website' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/var/website/directions.txt' do
  content 'website goes here'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this."
end
