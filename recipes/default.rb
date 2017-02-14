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

repo_resource 'https://github.com/pages-themes/architect.git'

# Can call it either way
# message = data_bag_item('website', 'messages')['welcomeMessage']

messages = data_bag_item('website', 'messages')
message = messages['welcomeMessage']

file '/var/website/welcome.txt' do
  content message
end
