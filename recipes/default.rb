#
# Cookbook:: chefkata
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'nano'

directory '/var/website'

file '/var/website/directions.txt' do
  content 'website goes here'
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this"
end

remote_file '/var/website/logo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
end

execute 'echo ran command > /var/website/command.txt' do
  not_if { ::File.exist?('/var/website/command.txt') }
end