include_recipe 'ubuntu'
include_recipe 'nano'

directory '/var/website'

file '/var/website/directions.txt' do
  content 'website goes here'
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this"
end

remote_file '/var/website/cheflogo.jpg' do
  source 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgQmQ0CYwU3cpFE6gEB82cp6TSIcBJSisax_HVvEfsgYHGBsO8kQ'
end

# not_if makes this idempotent 
execute 'ran' do
  command 'echo ran command > /var/website/command.txt'
  not_if do ::File.exist?('/var/website/command.txt') end
end

# I only want to pull this repo when the "ran" command runs, and that will only run once, so I need to "subscribe" to that resource. After "subscribe", you put the action to be taken by this resource.
git 'architect' do
  destination '/var/website/architect'
  repository 'https://github.com/pages-themes/architect.git'
  action :nothing
  subscribes :sync, 'execute[ran]', :immediately
end
