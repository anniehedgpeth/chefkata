include_recipe 'ubuntu'
include_recipe 'nano'

directory 'website' do
  path '/var/website'
end

file 'directions' do
  path '/var/website/directions.txt'
  content 'website goes here'
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this"
end

remote_file '/var/website/logo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
end

chefkata 'https://github.com/mhedgpeth/chef-by-example.git'
