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

remote_file '/var/website/logo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'echo' do
  command 'echo ran command > /var/website/command.txt'
  action :run
  not_if { ::File.exist?('/var/website/command.txt') }
  notifies :sync, 'git[/var/website/architect]', :immediately
end

git '/var/website/architect' do
  repository 'https://github.com/pages-themes/architect.git'
  action :nothing
end

