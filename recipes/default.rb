include_recipe 'ubuntu'

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

chefkata_ran_archrepo 'clonelink' do
  clonelink 'https://github.com/pages-themes/architect.git'
end

message = data_bag_item('website', 'message')
welcome = message['welcomeMessage']

file '/var/website/welcome.txt' do
  content welcome
end
