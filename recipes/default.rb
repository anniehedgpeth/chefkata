include_recipe 'ubuntu'
include_recipe 'nano'

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

execute 'ran' do
  command 'echo ran command > /var/website/command.txt'
  not_if{ ::File.exist?('/var/website/command.txt') }
end

git '/var/website/architect' do
  repository 'https://github.com/pages-themes/architect.git'
  action :nothing
  subscribes :sync, 'execute[ran]', :immediately
end
