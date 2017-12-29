#
# Cookbook:: chefkata
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
Chef::Log.warn('******************************Remember how to log???******************************')
puts '**************PUTS**************'
package 'nano' do
  action :install
end

directory '/var/website' do
  action :create
end

file '/var/website/directions.txt' do
  content 'website goes here'
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this"
end

remote_file '/var/website/logo.png' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
  action :create
end

architect_repo 'git' do
  git_link node['chefkata']['git_repo']
end

website_message = data_bag_item('website', 'message')
file '/var/website/welcome.txt' do
  content "#{website_message}"
end
