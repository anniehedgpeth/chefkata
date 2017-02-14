include_recipe 'ubuntu'

directory '/var/website'

file '/var/website/directions.txt' do
  content 'website goes here'
end

file '/var/website/builder.txt' do
  content "#{node['chefkata']['builder']} built this"
end

git '/var/website/arch' do
  repository "#{node['chefkata']['archrepo']}"
  action :sync
  not_if { ::File.exist?('/var/website/arch') }
end
